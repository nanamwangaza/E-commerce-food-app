import 'package:flutter/material.dart';
import 'package:get/get.dart';
// added get in pubspec.yaml, for state management

class Dimensions{
  static double screenHeight=Get.height; //the height and width are predefined, automatically brings height and width if the screen
  static double screenWidth=Get.width;

  static double PageViewParent=screenHeight/2.57;
  static double PageViewContainer=screenHeight/3.73;  //screen height is 821, div by 3.73 u get 220 which is the hardcoded height of page view container
    static double PageViewTextContainer=screenHeight/6.84; //u get 120, which is the hardcoded value

// Dynamic height padding and margin
  static double height10=screenHeight/82.1;
   static double height20=screenHeight/41.05;
    static double height15=screenHeight/54.73;
     static double height45=screenHeight/18.24;

// Dynamic width padding and margin
static double width10=screenHeight/82.1;
   static double width20=screenHeight/41.05;
    static double width15=screenHeight/54.73;
    static double width25=screenHeight/32.84;
     static double width45=screenHeight/18.24;


 // fonts and radius
    static double font20=screenHeight/41.05;
     static double radius30=screenHeight/27.37;
     static double radius15=screenHeight/54.73;

// Icon size
static double iconSize24=screenHeight/32.21;  //default icon size is 24

}