import 'package:flutter/material.dart';
import 'package:turfy/Common_Widgets/Custom_App_Bar.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Src/Sign_In_Ui/Sign_In_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Reffer_Earn_Sceen extends StatefulWidget {
  const Reffer_Earn_Sceen({super.key});

  @override
  State<Reffer_Earn_Sceen> createState() => _Reffer_Earn_SceenState();
}

class _Reffer_Earn_SceenState extends State<Reffer_Earn_Sceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: Custom_AppBar(isBlue: null, isNav: true,),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              richfont(Wtext: 'Invite & ', Gtext: 'Earn'),

              Container(
                width: MediaQuery.sizeOf(context).width/1.5,
                child: Text('Share the joy of convenient rides and earn exciting perks for every friend you refer.',
                  style: referT,
                ),
              ),

              Center(child: ImgPathSvg('refer.svg')),

              Text('Your Referral code',style: Rtext,),

              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 30),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1,color: earn),
                    color: white2
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 4,top: 4,bottom: 4),
                    child: Row(
                      children: [
                        Text('yjcc4c1acacak',style: TBlack,),

                        const Spacer(),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: green1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                            child: Text('Copy Code',style: CopyT,),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Center(child: Text('Share your Referral code via',style: Rtext,)),

              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImgPathSvg('wp.svg'),
                    const SizedBox(width: 15),
                    ImgPathSvg('x.svg'),
                    const SizedBox(width: 15),
                    ImgPathSvg('sms.svg'),
                    const SizedBox(width: 15),
                    ImgPathSvg('tele.svg')
                  ],
                ),
              ),
              Text('How it’s Works',style: Rtext,),
              Text('2. Your friends sign up for Turf App using your link or code.',style: Rtext,),
              Text('Step 1. Share your unique referral link or code with friends',style: Rtext,),
              Text(',Step 3. Both you and your friend earn rewards after their first successful ride.',style: Rtext,),

              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
