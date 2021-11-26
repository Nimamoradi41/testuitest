import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testuitest/AppShip/Trucks.dart';

import 'AppShip/DataBseFile.dart';
import 'AppShip/MainPage.dart';
import 'modeldatalogin.dart';
import 'package:http/http.dart'as http;

class ApiService{
  static ShowSnackbar(String Msg){
    if(Msg.contains('No host specified in URI'))
    {
      Msg='آدرس سرور اشتباه وارد شده است';
    }
    Fluttertoast.showToast(
        msg: Msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
  static Future Login(String userName,String password,BuildContext context2,ProgressDialog pr) async{
    Modeldatalogin? login=null;


















    if(!pr.isShowing())
    {
      pr.style(
        textAlign: TextAlign.center,
        message: 'درحال ارتباط با سرور..',
        messageTextStyle: TextStyle(
            fontFamily:  'iranyekanbold',
            fontSize: 14,
            color: Colors.black87),
      );
      await  pr.show();
    }
    var map = new Map<String, dynamic>();
    map['body'] = jsonEncode({
      "pass":password,
      "meliCode":userName,
      "phone":'10',
      "seriall":'postmanReza',
      "appVersion":'1',
      "confirmCode":'',
      "osType":'1'}) ;
    print(map.toString());
    final url = Uri.parse('http://31.7.67.183:2020/Api/Account/ConfirmByPass');
    // print(url.toString());
    // final url = Uri.parse('http://91.108.148.38:33221/CRM'+'/'+'Api/Atiran/login/login');
    print(url.toString());
    try{
      Response response = await http.post(url,  body:map,
      ).timeout(
        Duration(seconds: 15),
        onTimeout: () {
          // pr.hide();
          return   ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده است');
        },
      ).catchError((error) {
        pr.hide();
        print('eRROR IS'+error.toString());
        // return   ShowSnackbar(error.toString());
        // throw("some arbitrary error");
      }) ;

      print('Resi'+response.toString());
      if(response.statusCode==200)
      {
        print('Its Ok Request Nima');
        String data=response.body;
        var body=json.decode(data);
        var data1=body['data'];
        if(data1!=null)
          {
            var securityKey=data1['securityKey'];
            if(securityKey!=null)
              {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('securityKey',securityKey);
                Login_2(securityKey,context2,pr);
              }else{
              pr.hide();
              ShowSnackbar('کاربر یافت نشد');
            }

          }else{
          pr.hide();
          ShowSnackbar('کاربر یافت نشد');
        }
        print(body);
        // Modeldatalogin DATA=modeldataloginFromJson(data);
        // print(DATA.toJson());
        // login=DATA;
        // if(DATA.isSuccess==true)

      }else{
        pr.hide();
        print(response.statusCode.toString());

      }
    } on SocketException catch (e)
    {
      print('I am Here'+e.toString());
      pr.hide();
      login= null;
    }
    on TimeoutException catch (e) {
      pr.hide();
      print('Error issssssssswwwwww: $e');

    } on Error catch (e) {
      pr.hide();
      print('Error isssssssss: $e');
    }

    // pr.hide();
    // return login;
  }




  static Future Login_2(String securityKey,BuildContext context,ProgressDialog pr) async{
    Modeldatalogin? login=null;


















    // if(!pr.isShowing())
    // {
    //   pr.style(
    //     textAlign: TextAlign.center,
    //     message: 'درحال ارتباط با سرور..',
    //     messageTextStyle: TextStyle(
    //         fontFamily:  'iranyekanbold',
    //         fontSize: 14,
    //         color: Colors.black87),
    //   );
    //   await  pr.show();
    // }
    var map = new Map<String, dynamic>();
    map['body'] = jsonEncode({
      "securityKey":securityKey,
      "deviceType":'1',
      "imei":'postmanReza',
      "seriall":'postmanReza',
      "appVersion":'1',}) ;
    print(map.toString());
    final url = Uri.parse('http://31.7.67.183:2020/Api/Account/Login');
    // print(url.toString());
    // final url = Uri.parse('http://91.108.148.38:33221/CRM'+'/'+'Api/Atiran/login/login');
    print(url.toString());
    try{
      Response response = await http.post(url,  body:map,
      ).timeout(
        Duration(seconds: 15),
        onTimeout: () {
          pr.hide();
          return   ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده است');
        },
      ).catchError((error) {
        pr.hide();
        print('eRROR IS'+error.toString());
        // return   ShowSnackbar(error.toString());
        // throw("some arbitrary error");
      }) ;

      print('Resi'+response.toString());
      if(response.statusCode==200)
      {
        print('Its Ok Request Nima');
        String data=response.body;
        var body=json.decode(data);
        var data1=body['data'];
        if(data1!=null)
        {
          var token=data1['token'];
          print('111');
          if(token!=null)
          {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('token',token);
            print('222');
            GetTrucks(token.toString(),context,pr);
            // ShowSnackbar('ورود با موففقیت انجام شد');
          }else{
            pr.hide();
            ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده است');
          }

        }else{
          pr.hide();
          ShowSnackbar('کاربر یافت نشد');
        }
        print(body);
        // Modeldatalogin DATA=modeldataloginFromJson(data);
        // print(DATA.toJson());
        // login=DATA;
        // if(DATA.isSuccess==true)

      }else{
        pr.hide();
        ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده');
        print(response.statusCode.toString());

      }
    } on SocketException catch (e)
    {
      print('I am Here'+e.toString());
      pr.hide();
      login= null;
    }
    on TimeoutException catch (e) {
      pr.hide();
      print('Error issssssssswwwwww: $e');

    } on Error catch (e) {
      pr.hide();
      print('Error isssssssss: $e');
    }

    // pr.hide();
    // return login;
  }


  static Future<bool> Add_Tasck(ProgressDialog pr,String truckId,String enterDate,String exitDate) async{
    Modeldatalogin? login=null;



    bool Finall=false;







    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token=  prefs.getString('token');
    String? id=  prefs.getString('id');








    if(!pr.isShowing())
    {
      pr.style(
        textAlign: TextAlign.center,
        message: 'درحال ارتباط با سرور..',
        messageTextStyle: TextStyle(
            fontFamily:  'iranyekanbold',
            fontSize: 14,
            color: Colors.black87),
      );
      await  pr.show();
    }


    print(token);
    print(id);
    var map = new Map<String, dynamic>();
    map['body'] = jsonEncode({
      "truckId":truckId,
      "seoId":id,
      "enterDate":enterDate,
      "exitDate":exitDate,}) ;
    print(map.toString());
    final url = Uri.parse('http://31.7.67.183:2020/Api/Barshomar/TruckEnterFunnel');
    // print(url.toString());
    // final url = Uri.parse('http://91.108.148.38:33221/CRM'+'/'+'Api/Atiran/login/login');
    print(url.toString());
    try{
      Response response = await http.post(url,
          body:map,
          headers: {
            'Authorization': 'Bearer $token',
          }
      ).timeout(
        Duration(seconds: 15),
        onTimeout: () {
          pr.hide();
          Finall=false;

          return   ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده است');
        },
      ).catchError((error) {
        pr.hide();
        Finall=false;
        print('eRROR IS'+error.toString());
        // return   ShowSnackbar(error.toString());
        // throw("some arbitrary error");
      }) ;

      print('Resi'+response.toString());
      if(response.statusCode==200)
      {
        print('Its Ok Request Nima');
        String data=response.body;
        var body=json.decode(data);
        var data1=body['data'];
        if(data1!=null)
        {
          bool isSuccess=data1['isSuccess'];
          print('111');

          if(isSuccess)
            {
              Finall=true;
            }

        }else{
          Finall=false;
          pr.hide();
          ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده');
        }
        print(body);
        // Modeldatalogin DATA=modeldataloginFromJson(data);
        // print(DATA.toJson());
        // login=DATA;
        // if(DATA.isSuccess==true)

      }else{
        Finall=false;
        pr.hide();
        ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده');
        print(response.statusCode.toString());

      }
    } on SocketException catch (e)
    {
      Finall=false;
      print('I am Here'+e.toString());
      pr.hide();
      login= null;
    }
    on TimeoutException catch (e) {
      Finall=false;
      pr.hide();
      print('Error issssssssswwwwww: $e');

    } on Error catch (e) {
      Finall=false;
      pr.hide();
      print('Error isssssssss: $e');
    }

    // pr.hide();
    return Finall;
  }




  static Future<List<Trucks>> GetTrucks(String Token,BuildContext context,ProgressDialog pr) async{

    var MainData;
    final url = Uri.parse('http://31.7.67.183:2020/Api/Barshomar/GetBaseInfo');


    // ignore: unrelated_type_equality_checks
    // pr.style(
    //   textAlign: TextAlign.center,
    //   message: 'در حال دریافت اطلاعات ',
    //   messageTextStyle: TextStyle(
    //       fontFamily:  'iranyekanbold',
    //       fontSize: 14,
    //       color: Colors.black87),
    // );
    // await  pr.show();






    var map = new Map<String, dynamic>();
    // map['token'] = jsonEncode({ "userName":toke.User,
    //   "password":toke.Pass}) ;
    //
    // map['countpage']=jsonEncode(PageCounterCustomer);
    // map['countpage']=PageCounterCustomer;



    // print('sgfsfgsdfgfdsg'+map.toString());

    try{
      Response response = await post(url,headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $Token',
      }
        ,).timeout(
        Duration(seconds: 50),
        onTimeout: () {
          pr.hide();
          return   ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده است');
        },
      ).catchError((error) {
        pr.hide();
        print(error.toString());
        return   ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده است');
        throw("some arbitrary error");
      });;
      if(response.statusCode==200)
      {
        print('Its Ok Request Nima');
        String data=response.body;
        print(data);
        var body=json.decode(data);
        var data1=body['data'];
        if(data1!=null)
        {
          var trucks=data1['trucks'];
          var seo=data1['seo'];
          if(seo['completedServices']!=null)
            {
              int i=seo['completedServices'];
              String shipId=seo['shipId'];
              String id=seo['id'];
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt('completedServices',i);
              prefs.setString('shipId',shipId);
              prefs.setString('id',id);
            }

          if(seo['shipName']!=null)
          {
            String i1=seo['shipName'];
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('shipName',i1);
          }



          if(trucks!=null)
          {
            List<Trucks> MainData=[];
           for(int i=0;i<trucks.length;i++)
             {
               print(trucks[i]['id'],);

               var truckNumberId='';
               var truckName='';
               var qrcode='';
               var plateNumber='';
               var telephone='';
               var id='';
               print('data is'+trucks[i]['id']);
               if(trucks[i]['truckNumberId']!=null)
                 {
                   truckNumberId=trucks[i]['truckNumberId'];
                 }

               if(trucks[i]['truckName']!=null)
               {
                 truckName=trucks[i]['truckName'];
               }


               if(trucks[i]['qrcode']!=null)
               {
                 qrcode=trucks[i]['qrcode'];
               }


               if(trucks[i]['plateNumber']!=null)
               {
                 plateNumber=trucks[i]['plateNumber'];
               }

               if(trucks[i]['telephone']!=null)
               {
                 telephone=trucks[i]['telephone'];
               }


               if(trucks[i]['id']!=null)
               {
                 id=trucks[i]['id'];
               }
               MainData.add(Trucks(truckNumberId, truckName
                   , qrcode, plateNumber, telephone,id));
             }

            DataBseFile.db.Insert_Allof_Customer(MainData,context,pr);

            // ShowSnackbar('ورود با موففقیت انجام شد');
          }else{
            pr.hide();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
                  (Route<dynamic> route) => false,
            );
          }
        }else{
          pr.hide();
        }

      }else{
        pr.hide();
        print('response.statusCode '+response.statusCode.toString());
        // pr.hide();
      }
    }catch (e)
    {
      print('Eeror is Herer'+e.toString());
      ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده است');
      MainData= null;
      pr.hide();

    }
    return MainData;
  }
}