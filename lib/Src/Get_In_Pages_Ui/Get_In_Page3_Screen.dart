import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Authentication/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Get_In_Page3 extends StatefulWidget {
  const Get_In_Page3({super.key});

  @override
  State<Get_In_Page3> createState() => _Get_In_Page3State();
}

class _Get_In_Page3State extends State<Get_In_Page3> {

  final  LinearGradient _gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        gradient1,
        gradient2
      ]
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Stack(
              children: [

                //IMAGE
                ImgPathPng('page3.png'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  ShaderMask(
                      shaderCallback: (Rect rect) {
                        return _gradient.createShader(rect);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 20),
                        child: Text('Unlock the game with just a tap. Turf booking made simple, playtime at your fingertips.',
                          style: cardT.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,),
                      )),
                  Text('Revolutionize your game with our turf booking app. Effortlessly secure your spot on the field, anytime, anywhere. Download now and let the games begin.',
                      textAlign: TextAlign.center,
                      style: About
                  ),

                  //PAGE INDICATOR
                  Padding(
                    padding: const EdgeInsets.only(top: 25,bottom: 15),
                    child: ImgPathSvg('page3indicator.svg'),
                  ),
                  const SizedBox(height: 100,),

                  //BUTTON
                  CommonContainerButton(context, "GET STARTED", () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Sign_In_Screen()), (route) => false);

                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
