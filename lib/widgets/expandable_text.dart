import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/small_text.dart';

import '../utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({
    super.key,
     required this.text
     });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {

bool hiddenText=true;

double textHeight=Dimensions.screenHeight/5.47;  //gives 150

 late String firstHalf;
 late String secondHalf;

 @override initState(){
  super.initState();
  if(widget.text.length>textHeight){ //if the text is too long
    firstHalf=widget.text.substring(0,textHeight.toInt());
    secondHalf=widget.text.substring(textHeight.toInt()+1,widget.text.length); //will be hidden
  } else {
    firstHalf=widget.text;
    secondHalf=''; //will be empty
  }
 }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty?SmallText(text: firstHalf, size: Dimensions.font16,color: Colors.black38,height: Dimensions.lineHeight,):Column(
          children: [
            SmallText(text: hiddenText?(firstHalf+'...'):(firstHalf+secondHalf),size: Dimensions.font16,color: Colors.black38,height: Dimensions.lineHeight,),//the line height is 1.8

           InkWell(
            onTap: (){
           setState(() {
              hiddenText=!hiddenText;  //if was true will be false, and vice versa
           });
            },
            child: Row(
              children: [
                SmallText(text:hiddenText? 'Show  more':'Show less',color: AppColors.mainColor), //the showmore will only appear if the text is so long
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor,)
              ],
            ),
           )
          ],

          
        )
    );
  }
}