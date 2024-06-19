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


//FLOATING BUTTON
Widget Floating_Button(context) {
  return SpeedDial(
    curve: Curves.bounceInOut,

   animatedIconTheme: IconThemeData(color: Black),
    animatedIcon: AnimatedIcons.menu_close,
    backgroundColor: white1,
    shape: CircleBorder(),
    children: [
      SpeedDialChild(
          labelBackgroundColor: grey4,
          shape: CircleBorder(),
          child: Icon(Icons.add_comment_rounded,color: Black,),
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Create_Task_Screen()));
            },
          label: "Create a Task"),
      SpeedDialChild(
          labelBackgroundColor: grey4,
          shape: CircleBorder(),
          child: Icon(Icons.chat,color: Black,),
          onTap: () {
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat_Bot_Screen()));
          },
          label: "Chat for Help"),
    ],
  );
}





//CALL NOW BOTTON
Widget callNow_Button(
    BuildContext context,
    String titleName,

{required void Function()? onPress,required Color? backgroundColor}
    ) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      minimumSize: Size(double.infinity, 30),
      // elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    onPressed: onPress,
    child: Text(
      titleName,
      style: ButtonT1,
    ),
  );
}

//CHAT BUTTON
Widget Chat_Button(
    BuildContext context,
    void Function()? onPress,
    ){
  return InkWell(
    onTap: onPress,
    child: Container(
      height: 35,width: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: brown1
      ),
      child: Center(child: ImgPathSvg('Send.svg'))
    ),
  );
}

// CHECK BOX
Widget CheckBoxes(
    {required bool? value,
      required void Function(bool?)? onChanged,
      required String checkBoxText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          activeColor: brown1,
          onChanged: onChanged,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),

        RadioTerms("Terms & Conditions and"," Privacy Policy",
                ()
            async{  final url = "https://www.wetaskers.com/admin/terms_and_condition";
            await launch(
              url,
              forceSafariVC: true,
              forceWebView: true,
              enableJavaScript: true,
            );}, ()
            async{  final url = "https://www.wetaskers.com/admin/privacy_policy";
            await launch(
              url,
              forceSafariVC: true,
              forceWebView: true,
              enableJavaScript: true,
            );}
        ),
      ],
    ),
  );
}