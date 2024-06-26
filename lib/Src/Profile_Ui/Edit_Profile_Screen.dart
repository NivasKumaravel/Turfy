import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Common_Widgets/Text_Form_Field.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/Src/Sign_Up_Ui/Sign_Up_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
class My_Profile_Screen extends StatefulWidget {
  const My_Profile_Screen({super.key});

  @override
  State<My_Profile_Screen> createState() => _My_Profile_ScreenState();
}

class _My_Profile_ScreenState extends State<My_Profile_Screen> {

  RegExp onlyText = RegExp(r'^[a-zA-Z ]+$');

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            richfont(Wtext: 'My', Gtext: ' Profile'),

            //PROFILE IMAGE
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 30),
              child: Stack(
                children: [
                  ImgPathPng('profileimage2.png'),
                  Positioned(
                    right: 0,
                      bottom: 0,

                      //EDIT IMAGE
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_Up_Screen()));
                        },
                          child: ImgPathSvg('editprofile.svg')))
                ],
              ),
            ),


            //NAME
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: textFormField(
                hintText: 'Sujithguna',
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
                hintText: 'Sujithguna@gmail.com',
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

            //PHONE
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: textFormField(
                hintText: '+91 95926 21651',
                keyboardtype: TextInputType.text,
                inputFormatters: null,
                Controller: _phone,
                onChanged: null,
                validating: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter a Phone Number';
                  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit Phone Number';
                  }
                  return null;
                }, icon: 'phone.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
