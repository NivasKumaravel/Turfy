import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            richfont(Wtext: 'My', Gtext: ' Bookings'),

            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: profile,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      //PROFILE IMAGE
                      ImgPathPng('profileimage.png'),

                      //PROFILE DETAILS
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sujithguna',style: profilename,),
                            Text('Sujithguna@gmail.com',style: Rtext,),
                            Text('+91 95926 21651',style: Rtext,)
                          ],
                        ),
                      ),

                      const Spacer(),

                      ImgPathSvg('rightwhitearrow.svg')
                    ],
                  ),
                ),
              ),
            ),
            profilenav(text: 'My Wishlist'),
            profilenav(text: 'Invite & Earn'),
            profilenav(text: 'Terms & Conditions'),
            profilenav(text: 'Help & Support'),
            profilenav(text: 'Logout'),
          ],
        ),
      ),
    );
  }
}

Widget profilenav ({required String text}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: container,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
        child: Row(
          children: [
            Text(text,style: Profilecontainer,),
            const Spacer(),
            ImgPathSvg('rightwhitearrow.svg')
          ],
        ),
      ),
    ),
  );
}
