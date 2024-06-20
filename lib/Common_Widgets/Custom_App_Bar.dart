import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turfy/Common_Widgets/Image_Path.dart';
import '../utilits/Common_Colors.dart';
import '../utilits/Text_Style.dart';


class Custom_AppBar extends StatefulWidget implements PreferredSizeWidget {
  bool? isNav;
  bool? isBlue;
  Custom_AppBar({Key? key,required this.isBlue,required this.isNav})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<Custom_AppBar> {
  @override
  Widget build(BuildContext context) {
    return
      AppBar(
        primary: true,
        backgroundColor:background,
        automaticallyImplyLeading: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black, // Navigation bar
            statusBarColor: background,
            statusBarIconBrightness: Brightness.dark // Status bar
        ),

        leading: widget.isNav==true?InkWell(
          onTap: ()=>Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,top: 20),
              child: ImgPathSvg('back.svg'),
            )):null,
      );
  }
}

