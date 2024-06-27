import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Apply_Coupon_Ui/Apply_Coupon_Screen.dart';
import 'package:turfy/Src/Payment_Ui/Payment_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class After_Select_Time_Screen extends StatefulWidget {
  const After_Select_Time_Screen({super.key});

  @override
  State<After_Select_Time_Screen> createState() => _After_Select_Time_ScreenState();
}

class _After_Select_Time_ScreenState extends State<After_Select_Time_Screen> {

  bool isChecked = false;
  bool isChecked1 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30,top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: MediaQuery.sizeOf(context).width/1.1,
                  child: Text('Hindusthan turf',style: largetext,)),
              Container(
                width: MediaQuery.sizeOf(context).width/1.3,
                child: Text('Hindusthan gardens, Nava India Rd, Coimbatore, Tamil Nadu 64102',
                  style: bookslotT,textAlign: TextAlign.left,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 10),
                child: ImgPathPng('timeimage.png'),
              ),
          
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 20),
                child: Text('Payment Summary',style: paymentsummary,),
              ),
              
              RText(context,text1: 'Date', text2: '25 Jan, 2022', style: Rtext),
              RText(context,text1: 'Time', text2: '02:00 PM to 03.00 PM', style: Rtext),
              Row(
                children: [
                  Text('Pay Full Amount',style: Rtext,),
                  const Spacer(),
                  Icon(Icons.currency_rupee,color: white2,size: 18,),
                  Text('1200',style: Rtext,),

                  Checkbox(
                    activeColor: white2,
                      checkColor: green1,
                      value: isChecked,
                      onChanged:(bool ? value ) {
                          setState(() {
                            isChecked = value!;
                          });
                      }
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Pay Advance Only',style: Rtext,),
                  const Spacer(),
                  Icon(Icons.currency_rupee,color: white2,size: 18,),
                  Text('200',style: Rtext,),
                  Checkbox(
                      activeColor: white2,
                      checkColor: green1,
                      value: isChecked1,
                      onChanged:(bool ? value ) {
                        setState(() {
                          isChecked1 = value!;
                        });
                      }
                  ),
                ],
              ),
              RText(context,text1: 'Coupon', text2: 'Apply Coupon', style: BText),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Text('Convenience Fee',style: Rtext,),
                    const Spacer(),
                    Text('+',style: BText,),
                    Icon(Icons.currency_rupee,color: blue,size: 18,),
                    Text('20',style: BText,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Text('Amount Payable',style: Rtext,),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(Icons.currency_rupee,size: 20,color: green1,),
                        Text('1220',  style: TAmount,),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30,),

              //BUTTON
              CommonContainerButton(context, "Pay Now", (){
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_Screen()));
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget RText (context,{required String text1,required String text2,required TextStyle? style}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Row(
      children: [
        Text(text1,style: Rtext,),
        const Spacer(),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Apply_Coupon_Screen()));
          },
            child: Text(text2,style: style,))
      ],
    ),
  );
}
