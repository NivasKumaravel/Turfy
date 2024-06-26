import 'package:flutter/material.dart';
import 'package:turfy/Src/Home_Page_Ui/Home_Page_Screen.dart';
import 'package:turfy/Src/My_Booking_Ui/My_Booking_Screen.dart';
import 'package:turfy/Src/My_Notification_Ui/My_Notification_Sceen.dart';
import 'package:turfy/Src/Profile_Ui/Edit_Profile_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';


import 'Image_Path.dart';


class Bottom_Navigation extends StatefulWidget {
  int select;

   Bottom_Navigation({Key? key,required this.select}) : super(key: key);

  @override
  State<Bottom_Navigation> createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
   List<Widget>? pages;
   @override
   void initState() {
     super.initState();
     initializePages();
   }
  void initializePages() {
    pages = [
      Home_Page_Screen(),
      My_Booking_Screen(),
      My_Notification_Sceen(),
      My_Profile_Screen()
    ];
  }

  void b(index) {
    setState(() {
      widget.select = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: pages?[widget.select],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: brown1,
        backgroundColor: background,
        selectedItemColor: green1,
        selectedLabelStyle: TextStyle(color: green1),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _IconImg("homeinactive2.svg"),
            activeIcon: _IconImg("homeactive.svg"),
            label: "Home",
          ),
          BottomNavigationBarItem(
              activeIcon: _IconImg("mybookingactive.svg"),
              icon: _IconImg("mybookinginactive.svg"),
              label: "My Bookings"),
          BottomNavigationBarItem(
              activeIcon: _IconImg("notiactive.svg"),
              icon: _IconImg("notiinactive.svg"),
              label: "Notification"),
          BottomNavigationBarItem(
              activeIcon: _IconImg("profileactive.svg"),
              icon: _IconImg("profileinactive.svg"),
              label: "Profile",),
        ],
        currentIndex: widget.select,
        onTap: b,
      ),
    );
  }

  Widget _IconImg(String Img) {
    return Container(height: 20, width: 20, child: ImgPathSvg(Img));
  }
}




