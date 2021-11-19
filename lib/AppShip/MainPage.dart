import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Color(0xff091119),

            borderRadius: BorderRadius.circular(16)
        ),
        child:SingleChildScrollView(
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
                              child: Text('کشتی پاناما',
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
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text('25',style: TextStyle(
                                      color: Color(0xffF7FF00),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text('سرویس های در حال انجام',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0,left: 8.0,bottom: 16),
                                    child: Text('25',style: TextStyle(
                                      color: Color(0xffF7FF00),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0,left: 8.0,bottom: 16),
                                    child: Text('سرویس های در حال انجام شده',
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
                child: TextField(
                  textAlign: TextAlign.end,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                    hintText: 'جستجو کنید...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset('assets/png/adamak.png'),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16.0,right: 16.0),
                              child: Text('محمد صادق نیک نسب اهوازی ',
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
                              child: Text('ولوو2500',
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
                              child: Text('حمل صبای گستر ایرانیان 2',
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
                width: double.infinity,
                margin: EdgeInsets.all(8),
                child:Image.asset('assets/png/pelac.png',fit: BoxFit.fitWidth,),
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
                        child: Container()),
                    Expanded(
                        flex: 3,
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
                        child: Container()),
                    Expanded(
                        flex: 3,
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
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8,left: 8,),
                height: 70,
                color: Color(0xff213343),
              ),
              Container(
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
              )
            ],
          ),
        ) ,
      ),
    ));
  }
}
