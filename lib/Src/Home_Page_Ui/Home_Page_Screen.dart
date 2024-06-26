import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:turfy/Common_Widgets/Common_List.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Common_Widgets/Text_Form_Field.dart';
import 'package:turfy/Src/Profile_Ui/Edit_Profile_Screen.dart';
import 'package:turfy/Src/Profile_Ui/Profile_Screen.dart';
import 'package:turfy/Src/Turf_Description_Ui/Turf_Description_Screen.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Home_Page_Screen extends StatefulWidget {
  const Home_Page_Screen({super.key});

  @override
  State<Home_Page_Screen> createState() => _Home_Page_ScreenState();
}

class _Home_Page_ScreenState extends State<Home_Page_Screen> {

  int myCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: background,
        title: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Your Location',style: locationT,),
                        Icon(Icons.chevron_right,size: 12,color: location,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Coimbatore,634 187',style: locationT1,),
                    ),
                  ],
                ),

                const Spacer(),

                //PROFILE IMAGE
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile_Screen()));
                  },
                    child: ImgPathPng('profile.png'))
              ],
            ),
          ],
        ),
      ),
      backgroundColor: background,
      body: _mainbody(),
    );
  }

  Widget _mainbody (){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(

              //SEARCH BAR
              padding: const EdgeInsets.only(bottom: 15,left: 20,right: 20),
              child: textFormFieldSearchBar(
                  hintText: 'Search Turf...',
                  keyboardtype: TextInputType.text,
                  onTap: () {  }),
            ),

            //CAROUSELSLIDER
            CarouselSlider(
                items: [
                  _carouselImg(context,),
                  _carouselImg(context,),
                  _carouselImg(context,),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  aspectRatio: 16/9,
                  autoPlayAnimationDuration:Duration(milliseconds: 500),
                  onPageChanged: (index,reason){
                    setState(() {
                      myCurrentPage = index;
                    });
                  },
                )),

            //INDICATOR
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: myCurrentPage,
                  count: 3,
                  effect: SlideEffect(
                      dotHeight: 15,
                      dotWidth: 15  ,
                      dotColor: grey4,
                      activeDotColor: Colors.green
                  ),
                ),
              ),
            ),

            Head_text(text: 'Near You'),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index){
                    return Turf_list(context, image: 'ground.png', text: 'Hindustan turf', onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Turf_Description_Screen()));
                    });
                  }
              ),
            ),

            Head_text(text: 'In Your City'),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index){
                    return Turf_list(context, image: 'ground2.png', text: 'One more Game', onTap: () {  });
                  }
              ),
            ),

            Head_text(text: 'Popular Turfs'),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index){
                    return Turf_list(context, image: 'ground3.png', text: 'Hindustan turf', onTap: () {  });
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//CAROUSEL IMG STACK
Widget _carouselImg (context){
  return ImgPathPng('slider.png');
}

Widget Head_text ({required String text}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10,left: 15),
    child: Text(text,style: ListT,),
  );
}
