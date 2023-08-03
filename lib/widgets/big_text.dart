

import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  TextOverflow overflow;
  double size;

  
  BigText({
    super.key,
     required this.text,

     this.color=const Color(0xFFccc7c5),
    //  setting a default color we can't call it thru its class, ie. AppColors.black. Must write in its hex form
     this.overflow=TextOverflow.ellipsis,
     this.size=0,
     });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      // maxlines for bringing the overflow ellipsis
      style: TextStyle(
        color: color,
        fontSize:size==0? Dimensions.font20:size,
        // if size=0, we use the Dimensions.font20, else use whatever size put there
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto'
      ),
    );
  }
}