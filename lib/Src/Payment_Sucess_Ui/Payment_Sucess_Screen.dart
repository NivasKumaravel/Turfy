import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/After_Select_Time_Ui/After_Select_Time_Screen.dart';
import 'package:turfy/Src/Home_Page_Ui/Home_Page_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Payment_Sucess_Screen extends StatefulWidget {
  const Payment_Sucess_Screen({super.key});

  @override
  State<Payment_Sucess_Screen> createState() => _Payment_Sucess_ScreenState();
}

class _Payment_Sucess_ScreenState extends State<Payment_Sucess_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15,top: 20),
          child: ImgPathSvg('cancelimage.svg'),
        ),
      ),
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 50),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //SUCESS IMAGE
            ImgPathPng('sucess.png'),

            //SUCESS TEXT
            Center(child: Text('Your slot',style: PaymentT,)),
            Center(child: Text('booked succesfully!',style: sucess,)),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.sizeOf(context).width/1.1,
                child: Text('Hindusthan turf',style: largetext,)),

            //ADDRESS
            Container(
              width: MediaQuery.sizeOf(context).width/1.3,
              child: Text('Hindusthan gardens, Nava India Rd, Coimbatore, Tamil Nadu 64102',
                style: bookslotT,textAlign: TextAlign.left,),
            ),

            //PAYMENT SUMMARY
            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 10),
              child: Text('Payment Summary',style: paymentsummary,),
            ),
            RText(text1: 'Date', text2: '25 Jan, 2022', style: Rtext),
            RText(text1: 'Time', text2: '02:00 PM to 03.00 PM', style: Rtext),

            Row(
              children: [
                Text('Amount Payable',style: Rtext,),
                const Spacer(),
                Text('\$1220',  style: TAmount,)
              ],
            ),

            const SizedBox(height: 30),

            //BUTTON
            CommonContainerButton(context, "Go to Home", (){
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Page_Screen()));
              }
            }),
          ],
        ),
      ),
    );
  }
}
