import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
import 'Common_Button.dart';

//Inbox POPUP
Widget Accepted_Inbox_Pop_Up(BuildContext context,{required String bookingStatusT,required String bookingId,
required String adminId,required String acceptedBy,required String contentT,required void Function()? onPress}) {
  return AlertDialog(
    surfaceTintColor: white1,
    content:Container(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
              child: Text(bookingStatusT,style: profileT,)),
          Container(
            margin: EdgeInsets.only(top: 12,bottom: 15),
              child: Text('Booking ID: ${bookingId} \n Admin ID : ${adminId} \n Accepted by ${acceptedBy}',style: inboxT,textAlign: TextAlign.center)),
          Padding(
            padding: const EdgeInsets.only(bottom: 20,left: 30,right: 30),
            child: callNow_Button(context,'Call Us Now',onPress:onPress, backgroundColor: white1),
          ),
          Text(contentT,style: inboxT,textAlign: TextAlign.center,),
          Container(
            margin: EdgeInsets.only(top: 40,bottom: 30),
              child: CommonElevatedButton(context, "Done", () {
              Navigator.pop(context);

              })),

        ],
      ),
    ),
  );
}
//BOOKING REJECTED
Widget Rejected_Inbox_Pop_Up(BuildContext context,{required String bookingStatus,required String contentT}) {
  return AlertDialog(
    surfaceTintColor: white1,
    content:Container(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50,bottom: 20),
              child: Text(bookingStatus,style: profileT,)),
          Text(contentT,style: inboxT,textAlign: TextAlign.center,),
          Container(
            margin: EdgeInsets.only(top: 40,bottom: 30),
              child: CommonElevatedButton(context, "Done", () {
              Navigator.pop(context);

              })),

        ],
      ),
    ),
  );
}

//CONFIRM BOOKING
Widget Confirm_Pop(BuildContext context,{required String Title,required String content,required void Function()? onTap,required String buttonT}) {
  return AlertDialog(
    surfaceTintColor: white1,
    content:Container(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            margin: EdgeInsets.only(top: 50),
              child: Center(child: ImgPathPng('sucesslogo.gif'))),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Text('Confirm ${Title}',style: profileT,)),
          Container(
              margin: EdgeInsets.only(top: 10,),
              child: Text('Are you sure you want to confirm the ${content}',style: inboxT,textAlign: TextAlign.center,maxLines: 3,)),
          Container(
              margin: EdgeInsets.only(top: 40,bottom: 30),
              child: Row(
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width/3.3,
                    child: CommonElevatedButton(context, "Cancel", () {
                      Navigator.pop(context);
                    }),
                  ),
                   const Spacer(),
                  Container(
                    width:MediaQuery.of(context).size.width/3.3,
                    child: CommonElevatedButton(context, buttonT, onTap),
                  )
                ],
              )
          ),

        ],
      ),
    ),
  );
}

//COUPONS POP UP
Widget Coupon_PopUp(BuildContext context,{required void Function()? onTap,required String CouponCode}) {
  return AlertDialog(
    surfaceTintColor: white1,
    content:Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text('Coupons',style: totalT2,),
           ],
         ),

          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Container(
                 height:35,
                 margin: EdgeInsets.only(bottom: 20,top: 20,),
                 child: DottedBorder(
                     color: brown1,
                     borderType: BorderType.RRect,
                     child: Container(
                       height: 35,
                       child: Center(child: Padding(
                         padding: const EdgeInsets.only(left: 10,right: 10),
                         child: Text(CouponCode,style: TaskT1,),
                       ),),
                     ))
               ),
                Container(
                    child: Text('Are you sure you want to confirm the Coupons',style: inboxT,textAlign: TextAlign.center,maxLines: 2,)),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 40,bottom: 30),
              child: Row(
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width/3.3,
                    child: CommonElevatedButton(context, "Cancel", () {
                      Navigator.pop(context);
                    }),
                  ),
                  const Spacer(),
                  Container(
                    width:MediaQuery.of(context).size.width/3.3,
                    child: CommonElevatedButton(context, "Confirm", onTap),
                  )
                ],
              )
          ),

        ],
      ),
    ),
  );
}


//REJECTION SUCESSFULLY
Widget Rejection_Sucessfully_PopUp(BuildContext context) {
  return AlertDialog(
    surfaceTintColor: white1,
    content:Container(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              child: ImgPathSvg('taskerslogo.svg')),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Text('Rejection Successful',style: profileT,)),
          Container(
              margin: EdgeInsets.only(top: 15,bottom: 30),
              child: Text('Thank you for choosing Taskers,',style: inboxT,)),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: CommonElevatedButton(context, "Back To Home", () {
              //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Bottom_Navigation(select: 0, initialTabIndex: 0,)), (route) => false);
            }),
          ),
        ],
      ),
    ),
  );
}

//BOOKING SUCESSFULLY
Widget Booking_Sucessfully_Pop(BuildContext context) {
  return AlertDialog(
    surfaceTintColor: white1,
    content:Container(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              child: ImgPathSvg('taskerslogo.svg')),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Text('Booking Successful',style: profileT,)),
          Container(
              margin: EdgeInsets.only(top: 15,bottom: 30),
              child: Text('Thank you for choosing Taskers,',style: inboxT,)),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: CommonElevatedButton(context, "Back To Home", () {
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_Navigation(select: 0, initialTabIndex: 0,)));
            }),
          ),
        ],
      ),
    ),
  );
}
