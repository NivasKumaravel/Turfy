import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';

Future PopUp (context,{required String text}){
  return
    showDialog(context: context, builder:(BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        child: Container(
          height: MediaQuery.sizeOf(context).height/2.5,
          width: MediaQuery.sizeOf(context).width/2,
          decoration: BoxDecoration(
              color: coupon_Pop,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Text('Coupon'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Container(
                    height: 45,width: 130,
                    decoration: BoxDecoration(
                      color: white2,
                        border: RDottedLineBorder.all(
                            width: 1.5,
                            color: green1,
                            dottedLength: 5
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(child: Text('AB235YU1P',style: CouponT,)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 20),
                  child: Text('Are you sure you want to confirm the Coupons',style: Couponpop,textAlign: TextAlign.center,),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //BUTTON
                    cancel(context, "Cancel", (){}),
                    const Spacer(),
                    apply(context, "Confirm", (){}),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
    );
}