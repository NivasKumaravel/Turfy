import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Get_In_Pages_Ui/Get_In_Page3_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Get_In_Page2 extends StatefulWidget {
  const Get_In_Page2({super.key});

  @override
  State<Get_In_Page2> createState() => _Get_In_Page2State();
}

class _Get_In_Page2State extends State<Get_In_Page2> {

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Stack(
              children: [

                //IMAGE
                ImgPathPng('page2.png'),
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
                        child: Text('Reserve your turf, ignite your passion. Book your slot now and play to win.',
                          style: cardT.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,),
                      )),
                  Text('Take charge of your turf experience with easy slot booking. Reserve your playtime and conquer the field with confidence.',
                      textAlign: TextAlign.center,
                      style: About
                  ),

                  //PAGE INDICATOR
                  Padding(
                    padding: const EdgeInsets.only(top: 25,bottom: 15),
                    child: ImgPathSvg('page2indicator.svg'),
                  ),
                  const SizedBox(height: 100,),

                  //BUTTON
                  CommonContainerButton(context, "Next", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Get_In_Page3()));
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
