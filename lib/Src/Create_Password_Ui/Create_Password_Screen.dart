import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Text_Form_Field.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
class Create_Password_Screen extends StatefulWidget {
  const Create_Password_Screen({super.key});

  @override
  State<Create_Password_Screen> createState() => _Create_Password_ScreenState();
}

class _Create_Password_ScreenState extends State<Create_Password_Screen> {

  RegExp passwordSpecial = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).*$');
  RegExp passwordLength = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).{8,15}$');
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  //PASSWORD VISIBILITY FUNCTION
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  TextEditingController _password = TextEditingController();

  bool _obscureconfirmPassword = true;

  //PASSWORD VISIBILITY FUNCTION
  void _togglePasswordVisibility2() {
    setState(() {
      _obscureconfirmPassword = !_obscureconfirmPassword;
    });
  }

  TextEditingController _confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 100),
        child: _Mainbody(),
      ),
    );
  }

  Widget _Mainbody (){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //HEAD TEXTS
          Center(child: richfont(Wtext: 'Create', Gtext: ' New Password')),
          Center(child: rich(text: 'Please enter new password')),

          //PASSWORD
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: textFieldPassword(
              Controller: _password,
              obscure: _obscurePassword,
              onPressed: _togglePasswordVisibility,
              hintText: "Enter New Password",
              keyboardtype: TextInputType.text,
              validating:
                  (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a Password';
                } else if (!passwordSpecial.hasMatch(value)) {
                  return 'Password should be with the combination of Aa@#1';
                }else if(!passwordLength.hasMatch(value)){
                  return "Password should be with minimum 8 and maximum 15 characters";
                }
                return null;
              },
            ),
          ),

          //CONFIRM PASSWORD
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: textFieldPassword(
              Controller: _confirmpassword,
              obscure: _obscureconfirmPassword,
              onPressed: _togglePasswordVisibility2,
              hintText: "Confirm New Password",
              keyboardtype: TextInputType.text,
              validating:
                  (value) {
                if (value!.isEmpty) {
                  return 'Please Confirm a New Password';
                } else if (_password.text != _confirmpassword.text) {
                  return 'Password Does not match';
                }
                return null;
              },
            ),
          ),

          const Spacer(),

          //BUTTON
          CommonContainerButton(context, "Create Password", (){
            if(_formKey.currentState!.validate()){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
            }
          }),
        ],
      ),
    );
  }
}
