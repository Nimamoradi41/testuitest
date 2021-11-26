import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testuitest/ApiService.dart';
import 'package:testuitest/AppShip/DataBseFile.dart';
import 'package:testuitest/AppShip/Trucks.dart';

class MainPage extends StatefulWidget {


  @override
  State<MainPage> createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {



  Future Run(String datatemp)async{
    print(datatemp);
    var  data= await   DataBseFile.db.GetCustomers();
     print(data.toString());
    var rr=  data.where((element) =>element.truckNumberId.toString().contains(datatemp)).toList();
    if(datatemp.isNotEmpty)
      {
        if(rr.length>0)
          {
            setState(()  {
              print(rr[0].ToMapDatabase().toString());
              data_truck=rr[0];
            });
          }else{
          data_truck.truckNumberId='-77';
        }
      }
    else{
      setState(() {
        data_truck.truckNumberId='-77';
      });
    }
  }


  String Input_Time='';
  String Input_Date='';
  String OutPut_Time='';
  String OutPut_Date='';

  int completedServices=0;
  String shipName='';

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
  var txt=TextEditingController();
    Trucks data_truck=new Trucks('-77', 'truckName', '', '', '', '');
    Future getda() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getInt('completedServices')!=null){
      completedServices=prefs.getInt('completedServices')!;
    }  ;


      if(prefs.getInt('shipName')!=null){
        shipName=prefs.getString('shipName')!;
      }  ;




    }



    Future  Run_Add_Tasc(ProgressDialog progressDialog,String truckId) async{
      if(Input_Time.isEmpty)
        {
          ShowSnackbar('زمان ورود به قیف را وارد کنید');
          return;
        }


      if(Input_Date.isEmpty)
      {
        ShowSnackbar('تاریخ ورود به قیف را وارد کنید');
        return;
      }



      if(OutPut_Date.isEmpty)
      {
        ShowSnackbar('تاریخ خروج از قیف را وارد کنید');
        return;
      }


      if(OutPut_Time.isEmpty)
      {
        ShowSnackbar('زمان خروج از قیف را وارد کنید');
        return;
      }



      String ss_1=Input_Date+' '+Input_Time;
      String ss_2=OutPut_Date+' '+OutPut_Time;

      print(truckId);
      _showMyDialog(progressDialog,truckId,ss_1,ss_2);



    }

 Future   Run_Act(ProgressDialog progressDialog,String truckId,String enterDate,String exitDate) async
    {
       bool test=  await ApiService.Add_Tasck(progressDialog,truckId, enterDate, exitDate,data_truck) ;

       if(test)
         {
           ShowSnackbar('عملیات با موفقیت انجام شد');
           setState(() {
             Input_Time='';
               Input_Date='';
               OutPut_Time='';
               OutPut_Date='';

           });

         }
    }

  Future<void> _showMyDialog(ProgressDialog progressDialog,String truckId,String enterDate,String exitDate) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Align(
              alignment: Alignment.topRight,
              child: Text('مجوز')),
          content: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text('آيا عملیات انجام شود؟',textAlign: TextAlign.end,),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('بله'),
              onPressed: () {
                Navigator.of(context).pop();
                Run_Act(progressDialog,truckId,enterDate,exitDate);
              },
            ),
            TextButton(
              child: const Text('خیر'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

          ],
        );
      },
    );
  }


  String    Convert_DATE(String day,String month,String year)
  {
    var temp_day="";
    var temp_mont="";
    if (day.length==1)
    {
      temp_day="0"+day;
    }else{
      temp_day=day;
    }
    if (month.length==1)
    {
      temp_mont="0"+month;
    }else{
      temp_mont=month;
    }





    return  (year+"/"+temp_mont+"/"+temp_day).toString();


  }



  var pr;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: false);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff091119),
        ),

        child:Column(
          children: [
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          colors:[
                            Color(0xff0A131D),
                            Color(0xff1F2B38)
                          ]
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 24.0,right: 8),
                              child: Image.asset('assets/png/shipp.png',),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16,),
                                    child: Text(
                                      shipName.isEmpty?'بدون نام':
                                      shipName,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0,right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0,left: 8.0,bottom: 16),
                                          child: Text(completedServices.toString(),style: TextStyle(
                                            color: Color(0xffF7FF00),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0,left: 8.0,bottom: 16),
                                          child: Text('سرویس های انجام شده',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xff242F3A),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller:txt,
                              textAlign: TextAlign.end,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                                hintText: '... جستجو کنید',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(16),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Run(txt.text);
                            },
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xffF7FF00),
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset('assets/png/ssdd.svg'),
                              ) ,
                            ),
                          )
                        ],
                      ),
                    ),

                    data_truck!=null&&data_truck.truckNumberId!='-77'?
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0xff242F3A),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child:Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF7FF00),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Center(
                                          child: Text(  data_truck.truckNumberId.isEmpty?
                                           ' نامشخص ':
                                           data_truck.truckNumberId,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xff242F3A),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24,
                                            ),),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text( 'کد کامیون',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff242F3A),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),),
                                      )
                                    ],
                                  ) ,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0,right: 16.0),
                                        child: Text( data_truck.truckName,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Color(0xffF7FF00),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0,right: 16.0),
                                        child: Text(  data_truck.telephone.isEmpty?
                                        '  شماره تماس :'+ ' نامشخص ':
                                        '  شماره تماس :'+ data_truck.telephone
                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0,right: 16.0),
                                        child: Text(
                                          data_truck.plateNumber.isEmpty?
                                          '  شماره پلاک :'+ ' نامشخص ':
                                          '  شماره پلاک :'+ data_truck.plateNumber

                                          ,
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),),
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8,left: 8,top: 8,bottom: 4),
                          decoration: BoxDecoration(
                              color: Color(0xff465563),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8)
                              )
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 7,
                                  child: Container(
                                    child:  Center(
                                      child: Text(
                                        Input_Date.isEmpty?'':
                                        Input_Date+"   -   "+Input_Time,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: (){
                                      Jalali j = Jalali.now();
                                      setState(() {
                                        Input_Date=j.year.toString()+'/'+j.month.toString()+'/'+j.day.toString();
                                        DateTime now = DateTime.now();
                                        Input_Time= DateFormat('kk:mm:ss').format(now);
                                        print(Input_Time);
                                        print(Input_Date);
                                      });


                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8)
                                          ),
                                          color: Color(0xffF7FF00)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                                        child: Center(
                                          child: Text('ورود به قیف',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8,left: 8),
                          color: Color(0xff465563),
                          child:  Row(
                            children: [
                              Expanded(
                                  flex: 7,
                                  child: Container(
                                    child:  Center(
                                      child: Text(
                                        OutPut_Date.isEmpty?'':
                                        OutPut_Date+"   -   "+OutPut_Time,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: GestureDetector(
                                    onTap: (){
                                      Jalali j = Jalali.now();
                                      setState(() {
                                        OutPut_Date=j.year.toString()+'/'+j.month.toString()+'/'+j.day.toString();
                                        DateTime now = DateTime.now();
                                        OutPut_Time= DateFormat('kk:mm:ss').format(now);
                                        print(data_truck.id.toString());
                                        Run_Add_Tasc(pr,data_truck.id);

                                      });
                                    },
                                    child: Container(
                                      color: Color(0xffF7FF00),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                                        child: Center(
                                          child: Text('خروج از قیف',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),),
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8,left: 8,),
                          height: 70,
                          color: Color(0xff213343),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              Input_Date='';
                              OutPut_Time='';
                              OutPut_Date='';
                              Input_Time='';
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8,left: 8,bottom: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)
                                ),
                                color:Color(0xffF7FF00)
                            ),
                            child:  Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text('انصراف سرویس',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),),
                              ),
                            ),
                          ),
                        )
                      ],
                    ):Container()

                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8)
                        ),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors:[
                              Color(0xff0A131D),
                              Color(0xff1F2B38)
                            ]
                        )
                    ),
                  child: Row(
                    children: [
                      Expanded(child: SvgPicture.asset('assets/png/i_truck.svg')),
                      Expanded(child: SvgPicture.asset('assets/png/i_user.svg')),
                    ],
                  ),
                ))
          ],
        ) ,
      ),
    ));
  }
}
