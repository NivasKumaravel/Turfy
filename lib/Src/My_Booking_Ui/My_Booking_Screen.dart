import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class My_Booking_Screen extends StatefulWidget {
  const My_Booking_Screen({super.key});

  @override
  State<My_Booking_Screen> createState() => _My_Booking_ScreenState();
}

class _My_Booking_ScreenState extends State<My_Booking_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 30,bottom: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            richfont(Wtext: 'My', Gtext: ' Bookings'),

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
                        //width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: container
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImgPathPng('bookingimage.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: MediaQuery.sizeOf(context).width/2.5,
                                        child: Text('Hindusthan turf',style: Paymentamt,)),
                                    Container(
                                        width: MediaQuery.sizeOf(context).width/2.1,
                                        child: Text('Hindusthan gardens, Nava India Rd, Coimbatore, Tamil Nadu 64102',style: Bookingadd,)),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom: 10),
                                      child: Text('DATE : 17/05/2024',style: Bookingatimedate,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Text('TIME : 4AM-5AM',style: Bookingatimedate,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Amount Paid: ',style: book2,),
                                          Text('₹ 215.00',style: book3,)
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Balnace : ',style: book2,),
                                          Text('₹ 1000.00',style: RedT2,)
                                        ],
                                      ),
                                    ),

                                    Container(
                                      // height: MediaQuery.sizeOf(context).height/12,
                                      // width: MediaQuery.sizeOf(context).width/5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Field_Color,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 10),
                                              child: ImgPathSvg('slot.svg'),
                                            ),
                                            Text('5A Side',style: Slot,)
                                          ],
                                        ),
                                      ),
                                    ),
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
    );
  }
}
