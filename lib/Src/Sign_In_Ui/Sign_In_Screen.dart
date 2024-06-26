import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:turfy/Common_Widgets/Bottom_Navigation_Bar.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Common_Widgets/Text_Form_Field.dart';
import 'package:turfy/Src/Forgot_Password_Ui/Forgot_Password_Screen.dart';
import 'package:turfy/Src/Home_Page_Ui/Home_Page_Screen.dart';
import 'package:turfy/Src/Sign_Up_Ui/Sign_Up_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Sign_In_Screen extends StatefulWidget {
  const Sign_In_Screen({super.key});

  @override
  State<Sign_In_Screen> createState() => _Sign_In_ScreenState();
}

class _Sign_In_ScreenState extends State<Sign_In_Screen> {

  final _formKey = GlobalKey<FormState>();

  RegExp passwordSpecial = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).*$');
  RegExp passwordLength = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$])(?=.*[0-9]).{8,15}$');

  bool _obscurePassword = true;
  //PASSWORD VISIBILITY FUNCTION
  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }


  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      backgroundColor: background,
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

            //HEAD TEXTS
            Center(child: richfont(Wtext: 'Sign In', Gtext: ' Now')),
            Center(child: rich(text: 'Please sign in to book your slots')),

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
                hintText: "Enter current password",
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

            //FORGOT PASSWORD
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Forget Password?",style: Forget_password,),
              ],
            ),

            const SizedBox(height: 150,),

            //BUTTON
            CommonContainerButton(context, "Signin", () {
              if(_formKey.currentState!.validate())
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom_Navigation(select: 0)));
              }
            }),

            Padding(
              padding: const EdgeInsets.only(top: 25,bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?',style: lighttext,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up_Screen()));
                        },
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up_Screen()));
                            },
                            child: Text('Sign Up',style: Forget_password,))),
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

//RICH TEXTS
Widget richfont ({required String Wtext,required String Gtext}){
  return Padding(
    padding: const EdgeInsets.only(top: 20,bottom: 10),
    child: RichText(
      text: TextSpan(
          style: TextStyle(
            color: white2,
            fontSize: 30,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(text: Wtext),
            TextSpan(text: Gtext,
              style: TextStyle(
                color: gradient1,
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ]
      ),
    ),
  );
}

Widget rich ({required String text}){
   return Padding(
     padding: const EdgeInsets.only(bottom: 30),
     child: Text(text,
       textAlign: TextAlign.center,
       style: profileT.copyWith(color: Colors.white),
     ),
   );

}
