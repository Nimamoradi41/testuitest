import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:path/path.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:testuitest/AppShip/MainPage.dart';

import '../ApiService.dart';
import 'Trucks.dart';

class DataBseFile {


  int PageCounterCustomer=0;
  DataBseFile._();
  static final DataBseFile db = DataBseFile._();
   static Database? _database;

  Future<Database?> get database async {
    if (_database != null)
      return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await Init();
    return _database;
  }
  DataBseFile();

  static final Trucks_tbl ="Trucks";


   // DataBseFile.init();
   String path='';


   newTrucks(Trucks s)async{

     final db=await database;
        var res=await db!.rawInsert('''
        INSERT INTO Trucks (
        truckNumberId, truckName, qrcode, plateNumber, telephone, id    
        ) VALUES (?, ?, ?, ?, ?, ?)
        ''',[s.truckNumberId, s.truckName, s.qrcode, s.plateNumber, s.telephone, s.id]);
        print(res.toString());
        return res;
   }

  Init({String dbname:'appdatabase.db'})  async {
    return await openDatabase(join(await getDatabasesPath(),dbname),onCreate:( Database  db, int version)async{
      await db.execute('''
              CREATE TABLE Trucks (
              truckNumberId text,
              truckName text not null,
              qrcode text not null,
              plateNumber text not null,
              telephone text not null,
              id text not null)
                           ''');



    },version: 1);

  }






  Future<List<Trucks>>  GetCustomers() async
  {
    List<Trucks> Customers = <Trucks>[];
    final db=await database;
   var res  =await db!.query("Trucks");


    var datatemp;
    res.forEach((result) {
      var dd=  result;
      print(dd.toString());
      String truckNumberId=dd['truckNumberId'].toString();
      String truckName=dd['truckName'].toString();
      String qrcode=dd['qrcode'].toString();
      String plateNumber=dd['plateNumber'].toString();
      String telephone=dd['telephone'].toString();
      String id=dd['id'].toString();
      var s=Trucks(truckNumberId, truckName, qrcode, plateNumber, telephone, id);
      Customers.add(s);
    });
    return Customers;


    // close();



  }






  Future SendRequestCustomer(String Token,BuildContext context,ProgressDialog progressDialog) async
  {
    var Flag2=false;

    var Data=await ApiService.GetTrucks(Token,context,progressDialog);


    var  ss=await  Insert_Allof_Customer(Data,context,progressDialog);


    print('fINISHEED');


  }





  Future  Insert_Allof_Customer(List<Trucks> model,BuildContext context,ProgressDialog pr) async
  {

       final db=await database;


       // if()
       //  print('is Trureeeee');
        await db!.delete(Trucks_tbl);


    var dd=  await Future.wait(model.map((e) async {
      var ress=  await db!.insert(Trucks_tbl,e.ToMapDatabase(),conflictAlgorithm: ConflictAlgorithm.ignore);
      print('Id is '+ress.toString());
      return ress.toString();
    }));



       pr.hide();

       Navigator.pushAndRemoveUntil(
         context,
         MaterialPageRoute(builder: (context) => MainPage()),
             (Route<dynamic> route) => false,
       );





    // final db=await database;
    // var page= 9;
    // var pageCounter=0;
    // if(page==0)
    //   {
    //     var res2  =await db!.delete('Customer');
    //   }
    //
    // if(pageCounter<page)
    // {
    //     var dd=  await Future.wait(model.map((e) async {
    //       var uuid = Uuid();
    //       e.id=uuid.v1().toString();
    //       var ress=  await db!.insert(Customer_tbl,e.ToMapDatabase(),conflictAlgorithm: ConflictAlgorithm.replace);
    //       print('Id is '+ress.toString());
    //       return ress.toString();
    //     }));
    //     print(dd.toString());
    //     pageCounter=pageCounter+1;
    //     print('Conter is'+pageCounter.toString());
    //     return pageCounter.toString();
    //     Insert_Allof_Customer(model);
    //
    //   }




  // close();



  }













    // close();





  Future close() => _database!.close();

}