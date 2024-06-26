import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:turfy/Src/Apply_Coupon_Ui/Apply_Coupon_Screen.dart';
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

// ELEVATED BUTTON Red
Widget Yes(
    BuildContext context,
    String titleName,
    void Function()? onPress,
    ){
  return Container(
    width: MediaQuery.sizeOf(context).width/1.8,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: red,
        minimumSize: Size(double.infinity, 50),
        elevation: 9,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPress,
      child: Text(
        titleName,
        style: ButtonT,
      ),
    ),
  );
}

Widget No(
    BuildContext context,
    String titleName,
    void Function()? onPress,
    ){
  return Container(
    width: MediaQuery.sizeOf(context).width/1.8,
    child: ElevatedButton(
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

// ELEVATED BUTTON
Widget Slotbutton(
    BuildContext context,
    String titleName,
    void Function()? onPress,
    ){
  return Container(
    //height: MediaQuery.sizeOf(context).height/18,
    width: MediaQuery.sizeOf(context).width/2.3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20)
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Field_Color,
        minimumSize: Size(double.infinity, 50),
        elevation: 9,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: (){
      },
      child: Row(
        mainAxisAlignment:  MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImgPathSvg('slot.svg'),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(titleName,style: Slot,),
          )
        ],
      )
    ),
  );
}

//TEXTFIELD DATE PICKER
Widget TextFieldDatePickerF(context,{TextEditingController? Controller,
  String? Function(String?)? validating,
  void Function(String)? onChanged,required String hintText,void Function()? onTap}){
  return  Container(
    width: MediaQuery.sizeOf(context).width,
    child: TextFormField(
      controller:Controller ,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTap,
      readOnly: true,
      keyboardType: TextInputType.number,
      maxLength: 15,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Field_Color),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Field_Color),
        ),
        counterText: "",
        hintText: 'Choose a Date',
        //helperStyle: HintST,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10,left: 10),
          child: ImgPathSvg('calendar.svg'),
        ),
        hintStyle: Slot,
        errorMaxLines: 1,
        // contentPadding: const EdgeInsets.only(
        //     top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
        fillColor: Field_Color,
        filled: true,
      ),
      validator: validating,
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: Colors.black,
      ),
    ),
  );
}

// ELEVATED BUTTON Main
Widget cancel(
    BuildContext context,
    String titleName,

    void Function()? onPress,
    ){
  return InkWell(
    onTap: (){
      Navigator.pop(context);
    },
    child: Container(
      width: MediaQuery.sizeOf(context).width/3.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: white2,
          minimumSize: Size(double.infinity, 50),
          elevation: 9,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: onPress,
        child: Center(
          child: Text(
            titleName,
            style: cancelbutton,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}

Widget apply(
    BuildContext context,
    String titleName,

    void Function()? onPress,
    ){
  return Container(
    width: MediaQuery.sizeOf(context).width/3.6,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: gradient1,
        minimumSize: Size(double.infinity, 50),
        elevation: 9,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPress,
      child: Center(
        child: Text(
          titleName,
          style: CouponT1,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}