import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import 'package:turfy/Common_Widgets/Text_Form_Field.dart';
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
      backgroundColor: background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: textFormFieldSearchBar(
                hintText: 'Search Turf...',
                keyboardtype: TextInputType.text,
                onTap: () {  }),
          ),


          CarouselSlider(
              items: [
                _carouselImg(context,),
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
          Padding(
            padding: const EdgeInsets.only(top: 15,bottom: 10),
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
          
          Text('Near You',style: ListT,),

          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Stack(
                      children: [
                        ImgPathPng('ground.png'),
                        Text('najskcnajk')
                      ],
                    )
                  );
                }
            ),
          )

        ],
      ),
    );
  }
}


//CAROUSEL IMG STACK
Widget _carouselImg (context){
  return Padding(
    padding: const EdgeInsets.only(left: 10,right: 10),
    child: ImgPathPng('slider.png')
  );
}
