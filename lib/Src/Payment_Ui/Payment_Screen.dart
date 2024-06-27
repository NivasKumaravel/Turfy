import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Payment_Sucess_Ui/Payment_Sucess_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Payment_Screen extends StatefulWidget {
  const Payment_Screen({super.key});

  @override
  State<Payment_Screen> createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {
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
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: container,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Select Prefered Payment',style: PaymentT,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    child: Text('Total Payable : 1215',style: Paymentamt,),
                  ),
                  Text('Balance : 1000',style: RedT,)
                ],
              ),
            ),
          ),

          //PAYMENT METHOD
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: container,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10,left: 5),
                      child: Text('UPI',style: Paymentamt,),
                    ),
                    PaymentContainer(context,image: 'gpay.png', text: 'Google Pay', image2: 'rightarrow.svg', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_Sucess_Screen()));
                    }),
                    const SizedBox(height: 10,),
                    PaymentContainer(context,image: 'phonepay.png', text: 'Phonepe', image2: 'rightarrow.svg', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_Sucess_Screen()));
                    }),
                  ],
                ),
              ),
            ),
          ),

          //PAYMENT METHOD
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: container,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10,left: 5),
                      child: Text('Card Payment',style: Paymentamt,),
                    ),
                    PaymentContainer(context,image: 'card.png', text: 'Add Credit / Debit Card', image2: '', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_Sucess_Screen()));
                    }),
                    const SizedBox(height: 10,),
                    PaymentContainer(context,image: 'phonepay.png', text: 'HDFC Card', image2: 'rightarrow.svg', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_Sucess_Screen()));
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget PaymentContainer (context,{required String image,
  required String text,
  required String image2,
  required void Function()? onTap
}){
  return InkWell(
  onTap: onTap,
    child: Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: grey4,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImgPathPng(image),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(text,style: paymentT2,),
            ),
            const Spacer(),
            ImgPathSvg(image2)
          ],
        ),
      ),
    ),
  );
}
