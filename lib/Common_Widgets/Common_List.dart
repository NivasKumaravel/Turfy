import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
import 'Image_Picker.dart';

Widget Turf_list (context,{required String image,required String text}){
  return Padding(
      padding: const EdgeInsets.only(right: 10,left: 10),
      child: Stack(
        children: [
          ImgPathPng(image),
          Positioned(
              bottom: 10,left: 10,
              child: Container(
                  width: MediaQuery.sizeOf(context).width/6.5,
                  child: Text(text,style: cardT,))),
          Positioned(
            bottom: 9,left: 60,
            child: Row(
              children: [
                ImgPathSvg('fillstar.svg'),
                ImgPathSvg('fillstar.svg'),
                ImgPathSvg('fillstar.svg'),
                ImgPathSvg('fillstar.svg'),
                ImgPathSvg('star.svg'),
              ],
            ),
          )
        ],
      )
  );
}

//NOTIFICATION LIST
Widget Notification_List(context, {required String NotificationType,required String descriptionT,required String dateT}) {
  Color containerColor;
  String? ImgPath;

  switch (NotificationType) {
    case "Rewards":
      containerColor = brown1;
      ImgPath = 'award.svg';
      break;
    case "Payment Notification":
      containerColor = green1;
      ImgPath = 'creditcard1.svg';
      break;
    case "Cashback":
      containerColor = brown1;
      ImgPath = 'discount.svg';
      break;
    case "Pending":
      containerColor = orange1;
      ImgPath = 'creditcard2.svg';
      break;
    default:
      containerColor = Colors.black;
      break;
  }
  return Container(
    height: 55,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: containerColor),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ImgPathSvg("${ImgPath}"),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NotificationType,
                  style: phoneHT,
                ),
                Text(
                  descriptionT,
                  style: ratingT,
                )
              ],
            ),
            Spacer(),
            Text(
              dateT,
              style: ratingT,
            ),
          ],
        ),
      ),
    ),
  );
}

//INBOX LIST
Widget Inbox_List(context,
    {
    required String bookingText,
    required String messageContent,
    required String Time}) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 20),
        child: Row(
          children: [
            //BOOKING TEXT
            Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Text(
                  bookingText,
                  style: cardDetailT,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),

            const Spacer(),
            Text(
              Time,
              style: timeT,
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
        child: Text(
          messageContent,
          style: inboxT,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Divider(
        height: 1,
        color: white1,
      ),
    ],
  );
}


//DESCRIPTION IMAGES
Widget Description_Images({required String descriptionImg}){
  return Container(
    height: 100,
    width: 100,
   child: buildImage(
       descriptionImg,
       border: const Radius.circular(10),
       fit: BoxFit.cover),
  );
}

//REVIEW LIST
Widget Review_List(context,{required String ProfilePic,required String ProfileName,required String Date,
required int StarCount,required,required String count,required String Review }){
  return Container(
    margin: EdgeInsets.only(left: 20,right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: 50,
         child:  buildImage(
             ProfilePic,
             border: const Radius.circular(25),
             fit: BoxFit.cover),
         ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(ProfileName,style: phoneHT,maxLines: 2,),
                  const SizedBox(width: 10,),
                  Text(Date,style: timeT,),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 80,
                    child: ListView.builder(
                      itemCount: StarCount,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ImgPathSvg('star.svg'),
                        );
                      },),
                  ),
                  Text(count,style: ratingT,)
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width/1.4,
                  child: Text(Review,style: inboxT,maxLines: 3,textAlign: TextAlign.start,))

            ],
          ),
        ),
      ],
    ),
  );
}