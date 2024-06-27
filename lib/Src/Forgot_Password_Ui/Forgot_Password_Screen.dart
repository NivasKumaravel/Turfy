import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Text_Form_Field.dart';
import 'package:turfy/Src/OTP_Verification_Ui/OTP_Verification_Screen.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
class Forgot_Password_Screen extends StatefulWidget {
  const Forgot_Password_Screen({super.key});

  @override
  State<Forgot_Password_Screen> createState() => _Forgot_Password_ScreenState();
}

class _Forgot_Password_ScreenState extends State<Forgot_Password_Screen> {

  TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 100),
        child: _mainbody(),
      ),
    );
  }

  Widget _mainbody (){
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //HEAD TEXTS
          Center(child: richfont(Wtext: 'Forget', Gtext: ' Password')),
          Center(child: rich(text: 'Enter your Email account to reset password',)),

          //EMAIL
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: textFormField(
              hintText: 'Enter Your Mail ID',
              keyboardtype: TextInputType.text,
              inputFormatters: null,
              Controller: _email,
              validating: (value) {
                if (value!.isEmpty) {
                  return "Please Enter a Email Address";
                } else if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return "Please Enter a Valid Email Address";
                }
                return null;
              },
              onChanged: null, icon: 'mail.svg',
            ),
          ),

          const Spacer(),

          //BUTTON
          CommonContainerButton(context, "Forget Password", (){
            if(_formKey.currentState!.validate()){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP_Verification_Screen()));
            }
          }),
        ],
      ),
    );
  }
}
