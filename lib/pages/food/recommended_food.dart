import 'package:flutter/material.dart';
import 'package:food_app/widgets/app_icon.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/expandable_text.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:CustomScrollView(

        slivers: [
          SliverAppBar( //title takes a widget
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.clear),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
            ),

            toolbarHeight:80, //in scrolling, helps not to cut the row with icons
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/burger2.jpg',
                 width:double.maxFinite,
                 fit: BoxFit.cover,
                 ),
            ),
            expandedHeight: 400,
            pinned: true, //on scrolling, part of the app bar remains seen
            backgroundColor: Colors.black,

          bottom: PreferredSize(
            preferredSize:Size.fromHeight(20),
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 5,bottom: 10),
              decoration: BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20)
              )),
              child: Center(
                child: BigText(text: 'Beef Burger', color: AppColors.mainBlackColor,size: Dimensions.font26,)
              )
              )
          ),
            
          ),

          SliverToBoxAdapter(
              child: Column(
                children: [
                   Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                child: ExpandableText(text: 'Delight in fluffy, golden pancakes, a breakfast classic enjoyed worldwide. Served with a drizzle of maple syrup or adorned with berries, they offer a comforting and indulgent start to the day. Whether stacked high or savored one by one, pancakes always bring a smile to the table.Fluffy clouds of batter sizzle on the griddle, transforming into delectable pancakes that hold the promise of a delightful morning. Whether adorned with chocolate chips, a sprinkle of cinnamon, or a dollop of whipped cream, these circular delights are a canvas for creativity, a vessel of warmth, and a symbol of culinary comfort.Pancakes, those iconic breakfast companions, conjure a sense of homely nostalgia. The mere sizzle of batter hitting the hot pan awakens the senses, as swirls of steam rise to unveil their golden-brown perfection. Each bite offers a symphony of textures – a crisp edge giving way to a fluffy interior. From traditional buttermilk to international variations like crepes or Japanese soufflé pancakes, these creations reflect diverse cultures and tastes. Whether enjoyed leisurely on a weekend morning or hastily devoured on a busy weekday, pancakes remain a beloved culinary treasure, inviting us to relish life simple pleasures and embrace the art of breakfast')),
         
                ],
              ))
        ],
      ),

      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min, //without this, the column goes over our screen(conceals everything in scaffold, so this gives min size, also goes at the bottom)
        children: [
          Container(
            padding: EdgeInsets.only(
              top:Dimensions.height10,
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              bottom: Dimensions.height10
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               AppIcon(icon: Icons.remove,backgroundColor: AppColors.mainColor,iconColor: Colors.white,iconSize: Dimensions.iconSize24,),
               BigText(text: '\$12.88  '+'X  '+'0',color: AppColors.mainBlackColor,size: Dimensions.font26,),
               AppIcon(icon: Icons.add,backgroundColor: AppColors.mainColor,iconColor: Colors.white,iconSize: Dimensions.iconSize24,)
            ],),
          ),
          Container(
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
              child:Icon(Icons.favorite,color: AppColors.mainColor,)
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
        ],
      ),
    );
  }
}