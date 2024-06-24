import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:turfy/Common_Widgets/Common_Button.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/utilits/Common_Colors.dart';
import 'package:turfy/utilits/Text_Style.dart';
class Turf_Description_Screen extends StatefulWidget {
  const Turf_Description_Screen({super.key});

  @override
  State<Turf_Description_Screen> createState() => _Turf_Description_ScreenState();
}

class _Turf_Description_ScreenState extends State<Turf_Description_Screen> {

  var rating = 0.0;
  int myCurrentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: _Mainbody(),
    );
  }

  Widget _Mainbody (){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //CAROUSELSLIDER
          Container(
            child: CarouselSlider(
                items: [
                  _carouselImg(context,),
                  _carouselImg(context,),
                  _carouselImg(context,),
                  _carouselImg(context,),
                ],
                options: CarouselOptions(
                  height: MediaQuery.sizeOf(context).height/2.5,
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
                )
            ),
          ),
          //INDICATOR
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: AnimatedSmoothIndicator(
                activeIndex: myCurrentPage,
                count: 4,
                effect: SlideEffect(
                    dotHeight: 15,
                    dotWidth: 15,
                    dotColor: grey4,
                    activeDotColor: Colors.green
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    children: [
                      Text('Description',style: Descripton_headT,),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: ImgPathPng('locations.png'),
                      ),
                      Text('3.3 Km Away fom you',style: Descripton_locationT,)
                    ],
                  ),
                ),
                Text('Lorem ipsum dolor sit amet consectetur. Turpis lacus volutpat vestibulum et. Nibh nec sed id phasellus aliquet nulla enim orci tortor. Fringilla felis posuere interdum morbi laoreet vestibulum magna netus nisl. Ultrices varius nunc mi sed. Molestie metus mattis senectus diam.',
                  style: About,textAlign: TextAlign.left,
                ),

                head_text(text: 'Address'),
                Text('Hindusthan gardens, Nava India Rd, Coimbatore, Tamil Nadu 641028',
                  style: About,textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    ImgPathPng('fasttime.png'),
                    Text('24 X 7',style: About,)
                  ],
                ),

                head_text(text: 'Review Summary'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      //RATING PERCENTAGE
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        loader(context,lead: '5', percent: 1.0),
                        loader(context,lead: '4', percent: 0.9),
                        loader(context,lead: '3', percent: 0.6),
                        loader(context,lead: '2', percent: 0.4),
                        loader(context,lead: '1', percent: 0.2),
                      ],
                    ),
                    const Spacer(),

                    //STAR TOTAL RATING
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('4.7',style: Trating,),
                          SmoothStarRating(
                            allowHalfRating: true,
                            onRatingChanged: (v) {
                              rating = v;
                              setState(() {});
                            },
                            starCount: 5,
                            rating: rating,
                            size: 20.0,
                            filledIconData: Icons.star,
                            halfFilledIconData: Icons.star_half_outlined,
                            color: loaderclr,
                            borderColor: loaderclr,
                            spacing:0.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                //BUTTON
                CommonContainerButton2  (context, "Rate This Turf", () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Get_In_Page2()));
                }),

                //AVAILABLE SPORTS
                head_text(text: 'Available Sports'),
                Row(
                  children: [
                    ImgPathPng('football.png'),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: ImgPathPng('volletball.png'),
                    ),
                    ImgPathPng('cricket.png')
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Divider(
                    thickness: 2,
                    color: grey4,
                  ),
                ),

                head_text(text: 'Amenities'),
                Container(
                  height: MediaQuery.sizeOf(context).height/5,
                  //color: Colors.red,
                  child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 3,
                      childAspectRatio: 3/1,
                    ),
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: yellow,
                        ),
                        child: Center(child: Text('Parking',style: Amenities,)),
                      );
                    },
                  ),
                ),

                //BUTTON
                CommonContainerButton(context, "Book a Slot", (){
                  {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_DashBoard_Screen()));
                  }
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//CAROUSEL IMG STACK
Widget _carouselImg (context){
  return Container(
    height: MediaQuery.sizeOf(context).height/2,
    //width: MediaQuery.sizeOf(context).width,
    child: Stack(
      children: [
        ImgPathPng('slider2.png'),
        Positioned(
          top: 15,left: 15,
            child: ImgPathSvg('back.svg')),
        Positioned(
            top: 15,left: 15,
            child: ImgPathSvg('back.svg')),
        Positioned(
          right: 15,top: 15,
            child: ImgPathSvg('fav.svg')),
        Positioned(
          right: 65,top: 15,
            child: ImgPathSvg('share.svg')),
      ],

    ),
  );
}

Widget loader (context,{required String lead, required double? percent}){
  return LinearPercentIndicator(
    width: MediaQuery.sizeOf(context).width/1.8,
    progressColor: loaderclr,
    leading: Text(lead,style: ratingleading,),
    backgroundColor: grey4,
    percent: percent ?? 0.0,
    barRadius: Radius.circular(100),
  );
}

Widget head_text ({required String text}){
  return Padding(
    padding: const EdgeInsets.only(top: 10,bottom: 10),
    child: Text(text,style: Descripton_headT,),
  );
}