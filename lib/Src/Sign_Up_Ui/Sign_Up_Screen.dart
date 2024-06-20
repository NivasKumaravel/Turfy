import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Common_Widgets/Text_Form_Field.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Sign_Up_Screen extends StatefulWidget {
  const Sign_Up_Screen({super.key});

  @override
  State<Sign_Up_Screen> createState() => _Sign_Up_ScreenState();
}

class _Sign_Up_ScreenState extends State<Sign_Up_Screen> {

  RegExp passwordSpecial = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).*$');
  RegExp passwordLength = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).{8,15}$');
  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');

  bool _obscurePassword = true;
  //PASSWORD VISIBILITY FUNCTION
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
        child: _Mainbody(),
      ),
    );
  }

  Widget _Mainbody (){
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //HEADING TEXTS
            Center(child: richfont(Wtext: 'Sign Up', Gtext: ' Now')),
            Center(child: rich(text: 'Please fill the details and book the slots')),

            //NAME
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: textFormField(
                hintText: 'Enter Your Name',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _name,
                validating: (value) {
                  if (value
                      == null || value.isEmpty) {
                    return "Please Enter Name";
                  }
                  else if (!onlyText.hasMatch(value)) {
                    return "Please Enter User Name (Special Characters are Not Allowed)";
                  }
                  return null;
                },
                onChanged: null, icon: 'name.svg',
              ),
            ),

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

            //PASSWORD
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: textFieldPassword(
                Controller: _password,
                obscure: _obscurePassword,
                onPressed: _togglePasswordVisibility,
                hintText: "Enter Your Password",
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

            Text('Password must be 8 character',style: GreenT,),

            const SizedBox(height: 150,),

            //BUTTON
            CommonContainerButton(context, "Signup", (){
              if(_formKey.currentState!.validate()){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
              }
            }),

            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',style: lighttext,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_In_Screen()));
                        },
                        child: Text('Sign in',style: Forget_password,)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Center(child: Text('or login with',style: lighttext,)),
            ),

            //FACEBOOK AND GOOGLE
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImgPathPng('fb.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15),
                  child: Text('or',style: lighttext,),
                ),
                ImgPathPng('google.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}