import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';
import 'Image_Path.dart';

// ELEVATED BUTTON Main
Widget CommonContainerButton(
  BuildContext context,
  String titleName,
  void Function()? onPress,
){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: green1,
      minimumSize: Size(double.infinity, 50),
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT,
    ),
  );
}

// ELEVATED BUTTON
Widget CommonContainerButton2(
    BuildContext context,
    String titleName,
    void Function()? onPress,
    ){
  return Container(
    //height: MediaQuery.sizeOf(context).height/18,
    width: MediaQuery.sizeOf(context).width/2.1,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Sbutton,
        minimumSize: Size(double.infinity, 50),
        elevation: 9,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      onPressed: onPress,
      child: Text(
        titleName,
        style: ButtonT,
      ),
    ),
  );
}
