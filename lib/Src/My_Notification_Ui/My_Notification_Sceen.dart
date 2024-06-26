import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class My_Notification_Sceen extends StatefulWidget {
  const My_Notification_Sceen({super.key});

  @override
  State<My_Notification_Sceen> createState() => _My_Notification_SceenState();
}

class _My_Notification_SceenState extends State<My_Notification_Sceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 50,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              richfont(Wtext: 'My', Gtext: ' Notification'),
          
              const SizedBox(height: 10),
          
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  //color: Colors.orangeAccent,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: container,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,top: 15,bottom: 15),
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
                                      Text('Upcoming',style: Paymentamt2,),
                                      Container(
                                          width: MediaQuery.sizeOf(context).width/1.8,
                                          child: Text('Hindusthan turf',style: Paymentamt,)),
                                      Container(
                                          width: MediaQuery.sizeOf(context).width/1.8,
                                          child: Text('Hindusthan gardens, Nava India Rd, Coimbatore, Tamil Nadu 64102',style: Bookingadd,)),
          
                                      //DATE AND TIME
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5,bottom: 5),
                                        child: Text('DATE : 17/05/2024',style: notificationdatetime,),
                                      ),
                                      Text('TIME : 4AM-5AM',style: notificationdatetime,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
