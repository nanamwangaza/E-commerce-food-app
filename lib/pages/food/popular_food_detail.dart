import 'package:flutter/material.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/expandable_text.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    BigText(text: 'Introduce',color: AppColors.mainBlackColor,),

                       SizedBox(height: Dimensions.height20,),
                    Expanded(  // SingleChildScrollView must be used wih expanded widget
                      child: SingleChildScrollView(
                        child: ExpandableText(text: 'Delight in fluffy, golden pancakes, a breakfast classic enjoyed worldwide. Served with a drizzle of maple syrup or adorned with berries, they offer a comforting and indulgent start to the day. Whether stacked high or savored one by one, pancakes always bring a smile to the table.Fluffy clouds of batter sizzle on the griddle, transforming into delectable pancakes that hold the promise of a delightful morning. Whether adorned with chocolate chips, a sprinkle of cinnamon, or a dollop of whipped cream, these circular delights are a canvas for creativity, a vessel of warmth, and a symbol of culinary comfort.Pancakes, those iconic breakfast companions, conjure a sense of homely nostalgia. The mere sizzle of batter hitting the hot pan awakens the senses, as swirls of steam rise to unveil their golden-brown perfection. Each bite offers a symphony of textures – a crisp edge giving way to a fluffy interior. From traditional buttermilk to international variations like crepes or Japanese soufflé pancakes, these creations reflect diverse cultures and tastes. Whether enjoyed leisurely on a weekend morning or hastily devoured on a busy weekday, pancakes remain a beloved culinary treasure, inviting us to relish life simple pleasures and embrace the art of breakfast.')),
                    )
                  ],
                )
              )
              ),   
        ],
      ),

      bottomNavigationBar: Container(
        height: Dimensions.bottomNavHeight, //it's 120 
        padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height10, left: Dimensions.height20, right: Dimensions.height20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          ),
          color: AppColors.buttonBackgroundColor
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //with the two containers
          children: [


            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: '0', color: AppColors.mainBlackColor,),
                   SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ),
              child: BigText(text: '\$10 | Add to cart', color: Colors.white,), // the \ is for escapism in writting $
            )
          ],
        ),
      ),
    );
  }
}