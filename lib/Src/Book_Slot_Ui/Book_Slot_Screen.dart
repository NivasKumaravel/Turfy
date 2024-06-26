import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/After_Select_Time_Ui/After_Select_Time_Screen.dart';
import 'package:turfy/Src/Home_Page_Ui/Home_Page_Screen.dart';
import 'package:turfy/Src/Turf_Description_Ui/Turf_Description_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Book_Slot_Screen extends StatefulWidget {
  const Book_Slot_Screen({super.key});

  @override
  State<Book_Slot_Screen> createState() => _Book_Slot_ScreenState();
}

class _Book_Slot_ScreenState extends State<Book_Slot_Screen> {

  TextEditingController _BookDate = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("BOOIING DATE == ${_BookDate.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height/2,
                    width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("lib/assets/bookslotimage.png"),
                          fit: BoxFit.cover
                        ),
                      ),
                      ),
                  Positioned(
                      left: 20,top: 20,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: ImgPathSvg('back.svg'))),
                  Positioned(
                    bottom: 55,left: 20,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width/1.8,
                          child: Text('Hindusthan turf',style: largetext,))),
                  Positioned(
                    bottom: 20,left: 20,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width/1.7,
                          child: Text('Hindusthan gardens, Nava India Rd, Coimbatore, Tamil Nadu 64102',
                            style: bookslotT,textAlign: TextAlign.left,))),
                  Positioned(
                    bottom: 35,right: 40,
                      child: Text('4.7',style: Trating,)),
                  Positioned(
                    bottom: 30,right: 45,
                    child: Row(
                      children: [
                        ImgPathSvg('fillstar.svg'),
                        ImgPathSvg('fillstar.svg'),
                        ImgPathSvg('fillstar.svg'),
                        ImgPathSvg('fillstar.svg'),
                        ImgPathSvg('star.svg'),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    head_text(text: 'Select a Pitch'),
                    Row(
                      children: [
                        //BUTTON
                        Slotbutton (context, "5A Side", () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>Get_In_Page2()));
                        }),
          
                        const Spacer(),
          
                        //BUTTON
                        Slotbutton (context, "7A Side", () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>Get_In_Page2()));
                        }),
                      ],
                    ),
                    head_text(text: 'Booking Date'),
                    //DATE OF BIRTH
                    TextFieldDatePickerF(
                      context,
                      Controller: _BookDate,
                      onChanged: (value){
                        _BookDate.text = value;
                        print("OCHANGED DATE  ${value}");
                        },
                      hintText: 'dd/MM/yyyy',
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                          DateFormat("dd/MM/yyyy").format(pickedDate);
                          if (mounted) {
                            setState(() {
                              _BookDate.text = formattedDate;
                            });
                            print("ONTAP DATA ${_BookDate.text}");
                          }
                          DateTime currentDate = DateTime.now();
                          int age = currentDate.year - pickedDate.year;
                        }
                      },
                      validating: (value) {
                        if (value!.isEmpty) {
                          return 'Please Select Date of Birth';
                        } else {
                          DateTime selectedDate =
                          DateFormat("dd/MM/yyyy").parse(value);
                          DateTime currentDate = DateTime.now();
                          int age = currentDate.year - selectedDate.year;
          
                        }
                      },
                    ),
                    //SELECTING TIME
                    _BookDate.text == ""?SizedBox(height: 100,): Padding(
                      padding: const EdgeInsets.only(top: 15,left: 25,right: 25),
                      child: Container(
                        // height: MediaQuery.sizeOf(context).height/3,
                        //color: Colors.red,
                        child: GridView.builder(
                          itemCount: 8,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                            childAspectRatio: 3/1,
                          ),
                          itemBuilder: (BuildContext context, int index){
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: time,
                              ),
                              child: Center(child: Text('9:00 AM',style: timecontainer,)),
                            );
                          },
                        ),
                      ),
                    ),
        
                    //BUTTON
                    _BookDate.text == ""?Container(): Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CommonContainerButton(context, "Book a Slot", (){
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>After_Select_Time_Screen()));
                        }
                      }),
                    ),
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
