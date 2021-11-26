import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:testuitest/AppShip/MainPage.dart';

import '../ApiService.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ShowSnackbar(String Msg){

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

  Future Login_APP(String USERNAME,String Password,ProgressDialog pr) async
  {
    if(USERNAME.isEmpty)
    {
      ShowSnackbar('نام کاربری را وارد کنید');
      return;
    }


    if(Password.isEmpty)
    {
      ShowSnackbar('رمز عبور را وارد کنید');
      return;
    }














    var Loginchaeck=await ApiService.Login(USERNAME, Password,context,pr);

    // if(Loginchaeck!=null)
    // {
    //   if(Loginchaeck.isSuccess)
    //   {
    //     // print('Check_Remember'+Check_Remember.toString());
    //     // USERNAME= await USERNAME.toString().replaceAll('ک', 'ك');
    //     // USERNAME= await USERNAME.toString().replaceAll('ی', 'ي');
    //     // Password= await Password.toString().replaceAll('ک', 'ك');
    //     // Password= await Password.toString().replaceAll('ی', 'ي');
    //     // USERNAME =await Conv(USERNAME);
    //     // Password =await Conv(Password);
    //     // await Save(context,Loginchaeck.result,USERNAME,Password,Check_Remember,Loginchaeck.Token);
    //     // Navigator.pushAndRemoveUntil(
    //     //   context,
    //     //   MaterialPageRoute(builder: (context) => ScreenMain()),
    //     //       (Route<dynamic> route) => false,
    //     // );
    //   }else{
    //     print('A');
    //     // ShowSnackbar(Loginchaeck.msg);
    //   }
    // }else{
    //   ShowSnackbar('مشکلی در ارتباط با سرور به وجود آمده');
    // }
  }


  var text_1=TextEditingController();
  var text_2=TextEditingController();

  var pr;
  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(context,type: ProgressDialogType.Normal,isDismissible: false);
    return SafeArea(
      child: Scaffold(
         body: Container(
           height: double.infinity,
           width: double.infinity,
           decoration: BoxDecoration(
               color: Color(0xff091119),

           ),
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 48.0),
                   child:  Image.asset('assets/png/logo.png',width: 220,height: 220,),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(16),
                       color: Color(0xff333C42),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextField(
                         controller: text_1,
                         style: TextStyle(color: Colors.white),
                         textAlign: TextAlign.end,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.all(8),
                               border: InputBorder.none,
                               hintStyle: TextStyle(color: Colors.white),
                               hintText: 'نام کاربری')
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(16),
                       color: Color(0xff333C42),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextField(
                           style: TextStyle(color: Colors.white),
                           controller: text_2,
                           textAlign: TextAlign.end,
                           decoration: InputDecoration(
                               contentPadding: EdgeInsets.all(8),
                               border: InputBorder.none,
                               hintStyle: TextStyle(color: Colors.white),
                               hintText: 'رمز عبور')
                       ),
                     ),
                   ),
                 ),
                 GestureDetector(
                   onTap: (){
                     Navigator.pushAndRemoveUntil(
                       context,
                       MaterialPageRoute(builder: (context) => MainPage()),
                           (Route<dynamic> route) => false,
                     );
                   },
                   child: GestureDetector(
                     onTap: (){
                       Login_APP(text_1.text, text_2.text,pr);
                     },
                     child: Container(
                       width: double.infinity,
                       height: 65,
                       margin: EdgeInsets.symmetric(horizontal: 64,vertical: 32),
                       decoration: BoxDecoration(
                         color: Color(0xffF7FF00),
                           boxShadow: [
                             BoxShadow(
                               color: Color(0xffF7FF00).withOpacity(0.35),
                               spreadRadius: 3,
                               blurRadius: 4,
                               offset: Offset(0, 0), // changes position of shadow
                             ),
                           ],
                         borderRadius: BorderRadius.circular(16)
                       ),
                       child: Center(child: Text('ورود',style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 18
                       ),)),
                     ),
                   ),
                 ),
                 Text('? فراموشی رمز عبور',style: TextStyle(
                   color: Color(0xffF7FF00),
                   fontSize: 16,
                   fontWeight: FontWeight.bold
                 ),),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Text('ورود افلاین',style: TextStyle(
                       color: Color(0xffF7FF00),
                       fontSize: 16,
                       fontWeight: FontWeight.bold
                   ),),
                 )
               ],
             ),
           ),
         ),
      ),
    );
  }
}
