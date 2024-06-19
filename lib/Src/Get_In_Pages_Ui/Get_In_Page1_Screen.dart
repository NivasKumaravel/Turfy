import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Get_In_Pages_Ui/Get_In_Page2_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Get_In_Page1 extends StatefulWidget {
  const Get_In_Page1({super.key});

  @override
  State<Get_In_Page1> createState() => _Get_In_Page1State();
}

class _Get_In_Page1State extends State<Get_In_Page1> {

  final  LinearGradient _gradient = LinearGradient(
    colors: <Color>[
      gradient1,
      gradient2,
    ]
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Stack(
                children: [
                  ImgPathPng('page1.png'),
                  Positioned(
                    right: 20,
                    top: 30,
                      child: ImgPathSvg('skip.svg')),
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
                          padding: const EdgeInsets.only(top: 20,bottom: 20),
                          child: Text('Discover the closest turf near you  and kickstart your game today.',
                            style: cardT.copyWith(color: Colors.white),
                            textAlign: TextAlign.center,),
                        )),
                    Text('Discover nearby turfs for your next game. With convenience at your fingertips, finding the perfect pitch has never been easier. Step onto the field and let the competition ignite your passion for play.',
                        textAlign: TextAlign.center,
                        style: About
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25,bottom: 15),
                      child: ImgPathSvg('page1indicator.svg'),
                    ),
                    const SizedBox(height: 100,),
                    CommonContainerButton(context, "Next", () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Get_In_Page2()));
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
