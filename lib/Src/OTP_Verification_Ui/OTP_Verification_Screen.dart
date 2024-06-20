import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Src/Get_In_Pages_Ui/Get_In_Page1_Screen.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class OTP_Verification_Screen extends StatefulWidget {
  const OTP_Verification_Screen({super.key});

  @override
  State<OTP_Verification_Screen> createState() => _OTP_Verification_ScreenState();
}

class _OTP_Verification_ScreenState extends State<OTP_Verification_Screen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _otp1 = TextEditingController();
  TextEditingController _otp2 = TextEditingController();
  TextEditingController _otp3 = TextEditingController();
  TextEditingController _otp4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //HEAD TEXTS
            Center(child: richfont(Wtext: 'OTP', Gtext: ' Verification')),
            Center(child: rich(text: 'Please check your Email to see the verification code')),

            Padding(
              padding: const EdgeInsets.only(left: 25,bottom: 20),
              child: Text('Enter the OTP',style: profileT.copyWith(color: Colors.white),),
            ),
            Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  //OTP FIELD
                  textFieldOTP(controllers: _otp1),
                  textFieldOTP(controllers: _otp2),
                  textFieldOTP(controllers: _otp3),
                  textFieldOTP(controllers: _otp4),
                ],
              ),
            ),
            const Spacer(),

            //BUTTON
            CommonContainerButton(context, "OTP Verify", (){
              if(_formKey.currentState!.validate()){
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Get_In_Page1()));
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget textFieldOTP({bool? first, bool? last, controllers}) {
    return Container(
      height: 70,
      width: 60,
      // margin: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controllers,
        autofocus: true,
        maxLength: 1,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0) {
            setState(() {
              FocusScope.of(context).previousFocus();
            });
          }
        },
        showCursor: true,
        textAlign: TextAlign.center,
        style: phoneHT,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          fillColor: white1,
          filled: true,
          counter: Offstage(),
          enabledBorder: OutlineInputBorder(
              //borderSide: BorderSide(width: 1, color: gradient1),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              //borderSide: BorderSide(width: 1, color: gradient1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
