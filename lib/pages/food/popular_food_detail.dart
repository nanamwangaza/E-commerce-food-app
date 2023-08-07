import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/app_icon.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          //positioned widget helps to specify distance from edges of stack
          Positioned(
            left:0,
            right:0,
            child:Container(
              width: double.maxFinite,  //takes all the width available
              height: Dimensions.popularFoodImgSize,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/pancakes.jpg'),
              fit: BoxFit.cover
              )
            ),
            )
            ),

          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon:Icons.arrow_back),
                AppIcon(icon:Icons.shopping_cart_outlined),
              ],
            )
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0, //makes te container take complete height
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.width20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                    ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Mouth Watering Pancakes',),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: 'Introduce',color: AppColors.mainBlackColor,)
                  ],
                )
              )
              ),   
        ],
      ),

      bottomNavigationBar: Container(
        
      ),
    );
  }
}