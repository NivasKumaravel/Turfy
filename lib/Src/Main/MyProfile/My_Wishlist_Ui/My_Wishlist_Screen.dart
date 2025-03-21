import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Authentication/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';

class My_Wishlist_Screen extends StatefulWidget {
  const My_Wishlist_Screen({super.key});

  @override
  State<My_Wishlist_Screen> createState() => _My_Wishlist_ScreenState();
}

class _My_Wishlist_ScreenState extends State<My_Wishlist_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            richfont(Wtext: 'My', Gtext: ' Wishlist'),

            Container(
              height: MediaQuery.sizeOf(context).height,
              //color: Colors.orangeAccent,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10,top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: container,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15,right: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            //IMAGE
                            ImgPathPng('notificationimage.png'),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  //NOTIFICATION INSIDE TEXT
                                  Container(
                                      width: MediaQuery.sizeOf(context).width/2.5,
                                      child: Text('Hindusthan turf',style: Paymentamt,)),
                                  Container(
                                      width: MediaQuery.sizeOf(context).width/2.2,
                                      child: Text('Hindusthan gardens, Nava India Rd, Coimbatore, Tamil Nadu 64102',style: Bookingadd,)),
                                ],
                              ),
                            ),
                            const Spacer(),

                            ImgPathSvg('heart.svg'),
                          ],
                        ),
                      ),
                    ),
                  );
                },),
            ),
          ],
        ),
      ),
    );
  }
}
