import 'package:flutter/material.dart';
import 'package:testuitest/AppShip/MainPage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Container(
           height: double.infinity,
           width: double.infinity,
           margin: EdgeInsets.all(8),
           decoration: BoxDecoration(
               color: Color(0xff091119),

             borderRadius: BorderRadius.circular(16)
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
