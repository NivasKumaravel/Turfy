import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Common_List.dart';
import 'package:turfy/Common_Widgets/Common_Pop_Up.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Apply_Coupon_Screen extends StatefulWidget {
  const Apply_Coupon_Screen({super.key});

  @override
  State<Apply_Coupon_Screen> createState() => _Apply_Coupon_ScreenState();
}

class _Apply_Coupon_ScreenState extends State<Apply_Coupon_Screen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      backgroundColor: background,
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Coupon',style: largetext,),
          Text('Available Coupons',style: bookslotT,),

          //COUPONS
          Coupons(),
          Coupons(),

          const Spacer(),

          //BUTTON
          CommonContainerButton(context, "Apply Coupon", (){
            {
              PopUp(context,text: '');
            }
          }),
        ],
      ),
    );
  }
}
