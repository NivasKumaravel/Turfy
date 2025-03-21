import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Authentication/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/Src/Main/MyProfile/My_Wishlist_Ui/My_Wishlist_Screen.dart';
import 'package:turfy/Src/Main/MyProfile/Reffer_Earn_Ui/Reffer_Earn_Sceen.dart';
import 'package:turfy/Src/Main/Profile_Ui/Edit_Profile_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  @override
  void initState() {
    _enabled = true;
    Future.delayed(const Duration(seconds: 1),(){
      setState(() {
        _enabled = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Skeletonizer(
        effect: ShimmerEffect(baseColor: Colors.white10),
        enabled: _enabled,
          enableSwitchAnimation: true,
          child: _Mainbody()),

    );
  }

  Widget _Mainbody (){
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          richfont(Wtext: 'My', Gtext: ' Profile'),

          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 15),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>My_Profile_Screen()));
              },
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
          ),
          profilenav(text: 'My Wishlist', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>My_Wishlist_Screen()));
          }),
          profilenav(text: 'Invite & Earn', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Reffer_Earn_Sceen()));
          }),
          profilenav(text: 'Terms & Conditions', onTap: () {  }),
          profilenav(text: 'Help & Support', onTap: () {  }),
          profilenav(text: 'Logout', onTap: () {

            showDialog(context: context, builder:(BuildContext context){
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Container(
                  height: MediaQuery.sizeOf(context).height/3,
                  width: MediaQuery.sizeOf(context).width/1.4,
                  decoration: BoxDecoration(
                      color: coupon_Pop,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 15),
                        child: Container(
                            width: MediaQuery.sizeOf(context).width/2,
                            child: Text('Are You Sure Want To Logout?',style: logout,textAlign: TextAlign.center,)),
                      ),

                      //BUTTON
                      No(context, "Cancel", () {
                        {
                        Navigator.pop(context);
                        }
                      }),

                      const SizedBox(height: 10),

                      //BUTTON
                      Yes(context, "Yes", () {
                        {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Sign_In_Screen()), (route) => false);
                        }
                      }),

                    ],
                  )
                ),
              );
            }
            );
          }),


        ],
      ),
    );
  }
}

Widget profilenav ({required String text,required void Function()? onTap}){
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: InkWell(
      onTap:onTap,
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
    ),
  );
}
