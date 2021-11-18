import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         body: Container(
           height: double.infinity,
           width: double.infinity,
           margin: EdgeInsets.all(16),
           decoration: BoxDecoration(
               color: Color(0xff1A2325),
               gradient: LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                   colors: [
                     Color(0xff1A2325)
                     , Color(0xff434A4B)],




               ),
             borderRadius: BorderRadius.circular(16)
           ),
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(top: 48.0),
                   child: Icon(Icons.person,color:
                   Colors.white,size: 220,),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
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
                   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
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

                 Container(
                   width: double.infinity,
                   height: 65,
                   margin: EdgeInsets.symmetric(horizontal: 64,vertical: 32),
                   decoration: BoxDecoration(
                     color: Colors.amber,
                       boxShadow: [
                         BoxShadow(
                           color: Colors.amber.withOpacity(0.5),
                           spreadRadius: 3,
                           blurRadius: 4,
                           offset: Offset(0, 0), // changes position of shadow
                         ),
                       ],
                     borderRadius: BorderRadius.circular(16)
                   ),
                   child: Center(child: Text('ورود',style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 18
                   ),)),
                 ),

               ],
             ),
           ),
         ),
      ),
    );
  }
}
