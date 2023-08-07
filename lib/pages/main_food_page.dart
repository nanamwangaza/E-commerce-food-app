import 'package:flutter/material.dart';
import 'package:food_app/pages/food_page_body.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/small_text.dart';

import '../utils/dimensions.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // Header
          Container(


            child: Container(
              margin: EdgeInsets.only(top: Dimensions.width45, bottom: Dimensions.width15),
              padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                   BigText(text:'Tanzania', color: AppColors.mainColor,),
                      Padding(
                        padding:  EdgeInsets.only(left: Dimensions.width15),
                        child: Row(
                          children: [
                            SmallText(text: 'Dar-es-Salaam',color: Colors.black45,),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: Dimensions.width45,
                    height: Dimensions.width45,
                    child: Icon(Icons.search, color: Colors.white,size: Dimensions.iconSize24,),
                    decoration: BoxDecoration(
                      color:AppColors.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius15)
                    ),
                  )
                ],
              ),
            ),
          ),

          FoodPageBody(),
              // Expanded   expands a child widget to fill all available space along the main axis within its parent widget
        ],
      ),
    );
  }
}