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
