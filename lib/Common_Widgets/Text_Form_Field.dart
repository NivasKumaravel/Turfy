import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';

//TEXTFORM FIELD Main
Widget textFormField(
    {TextEditingController? Controller,
    String? Function(String?)? validating,
     bool? isEnabled,
    void Function(String)? onChanged,
      required String hintText,List<TextInputFormatter>? inputFormatters,
      required TextInputType keyboardtype,
      required String icon,
    }) {
  return
    Container(
      // height: 50,
      child:
      TextFormField(
        enabled: isEnabled,
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      inputFormatters: inputFormatters,
      validator: validating,
        decoration: InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: phoneHT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          //borderSide: BorderSide(color: white1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          //borderSide: BorderSide(color:white1),
        ),
          fillColor: Field_Color,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: ImgPathSvg(icon),
        ),
        filled: true,
      ),
      onChanged: onChanged,
      textInputAction: TextInputAction.next,
      style: phoneHT,
        keyboardType: keyboardtype,
  ),
    );
}

//TEXTFORM FIELD PASSWORD
Widget textFieldPassword(
    {TextEditingController? Controller,
      String? Function(String?)? validating,
      void Function(String)? onChanged,
      required bool obscure,
      required void Function()? onPressed,
      required String hintText,
      required TextInputType keyboardtype}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Container(
      // height: 50,
      child: TextFormField(
        controller: Controller,
        obscureText: obscure,
        validator: validating,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          hintText: hintText,
          hintStyle: phoneHT,
          border: OutlineInputBorder(
            //borderSide: BorderSide(color: white1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
              //borderSide: BorderSide(color: white1),
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: ImgPathSvg('lock.svg'),
          ),
          suffixIcon: IconButton(
            icon:obscure ? Icon(Icons.visibility_off,color: white2,) : ImgPathSvg('eye.svg'),
            onPressed: onPressed,
          ),
          fillColor: Field_Color,
          filled: true,
        ),
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardtype,
        style: phoneHT,
      ),
    ),
  );
}

//TEXTFIELD DATE PICKER
Widget TextFieldDatePicker({TextEditingController? Controller,
  String? Function(String?)? validating,
  void Function(String)? onChanged,required String hintText,void Function()? onTap}){
  return  TextFormField(
    controller:Controller ,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onTap: onTap,
    readOnly: true,
    keyboardType: TextInputType.number,
    maxLength: 15,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: white1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: white1),
      ),
      counterText: "",
      hintText: 'DD / MM / YYYY',
      helperStyle: phoneHT,
      prefixIcon: Icon(Icons.calendar_month,
        color:grey1,
        size: 24,),
      hintStyle: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
        color: Colors.grey,
      ),
      errorMaxLines: 1,
      contentPadding: const EdgeInsets.only(
          top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
      fillColor: white1,
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
  );
}


//DESCRIPTION
Widget textfieldDescription({
  TextEditingController? Controller,
  String? Function(String?)? validating,required String hintText}){
  return Container(
    // height: 50,
    child: TextFormField(
      controller: Controller,
      textCapitalization: TextCapitalization.none,
      maxLines: 5,
      minLines: 3,
      keyboardType: TextInputType.multiline,
      validator: validating,
      decoration: InputDecoration(
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: white1),
            borderRadius: BorderRadius.circular(10),
        ),
        fillColor: white1,
        filled: true,
      ),
      textInputAction: TextInputAction.next,
      style: phoneHT,
    ),
  );
}



//SEARCH BAR
Widget textFormFieldSearchBar(
    {
      TextEditingController? Controller,
      String? Function(String?)? validating,
      bool? isEnabled,
      void Function(String)? onChanged,
      required String hintText,
      List<TextInputFormatter>? inputFormatters,
      required TextInputType keyboardtype,
      required void Function()? onTap,
    }) {
  return
    Container(
      // height: 50,
      child:
      TextFormField(
        onTap:onTap,
        enabled: isEnabled,
        controller: Controller,
        textCapitalization: TextCapitalization.none,
        inputFormatters: inputFormatters,
        validator: validating,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          hintText: hintText,
          hintStyle: phoneHT,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1,color: Field_Color ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Field_Color,
          filled: true,
          prefixIcon: Icon(Icons.search,size: 24,color: white2,),
        ),
        onChanged: onChanged,
        textInputAction: TextInputAction.next,
        style: phoneHT,
        keyboardType: keyboardtype,
      ),
    );
}


class TimePickerFormField extends StatefulWidget {
  final Function() onValidate;
  String? time;
  TimePickerFormField({required this.onValidate,required this.time});

  @override
  _TimePickerFormFieldState createState() => _TimePickerFormFieldState();
}
class _TimePickerFormFieldState extends State<TimePickerFormField> {

  // @override
  // void initState() {
  //   super.initState();
  //   _selectedTime = TimeOfDay.now();
  // }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      String formattedTime = _formatTime(picked);
      setState(() {
        widget.time = formattedTime;
      });
      widget.onValidate(); // Call the validation callback
    }
  }
  String _formatTime(TimeOfDay time) {
    String period = time.period == DayPeriod.am ? 'AM' : 'PM';
    int hour = time.hourOfPeriod;
    int minute = time.minute;
    String formattedHour = hour.toString().padLeft(2, '0');
    String formattedMinute = minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute $period';

}
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: (){
        _selectTime(context);
        },
      readOnly: true,
      decoration: InputDecoration(
        counterText: "",
        hintText: "HH: MM : AM/PM",
        hintStyle: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          color: Colors.grey,
        ),
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: white1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: white1),
        ),
        fillColor: white1,
        filled: true,
        prefixIcon: IconButton(
          icon: Icon(Icons.access_time_outlined,
            color:grey1,
            size: 25,),
          onPressed: () {
            _selectTime(context);
          },
        ),

      ),
      onChanged: null,
        validator: (value) {
          if (value == "(HH:MM)") {
            return 'Please select a time';
          }
          return null;
        },
      textInputAction: TextInputAction.next,
      style: const TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        color: Colors.black,
      ),
    controller: TextEditingController(
    text: widget.time,
    ));
  }
}


