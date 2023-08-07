import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/utils/dimensions.dart';
import 'package:food_app/widgets/app_column.dart';
import 'package:food_app/widgets/big_text.dart';
import 'package:food_app/widgets/icon_and_text_widget.dart';
import 'package:food_app/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  // controls the page view
  double _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.PageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('screen height is' + MediaQuery.of(context).size.height.toString()); //prints on console screen height

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Dimensions.PageViewParent,
              child: PageView.builder(
                controller: pageController,
                itemCount: 5, //related to position. index starts from 0
                itemBuilder: ((context, position) {
                  return _buildPageItem(position);
                }),
              ),
            ),
            DotsIndicator(
              dotsCount: 5,
              position: _currentPageValue.toInt(),
              decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Container(
              margin: EdgeInsets.only(left: Dimensions.width30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(bottom: Dimensions.height2),
                      child: BigText(
                        text: 'Popular',
                        color: AppColors.mainBlackColor,
                      )),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Container(
                    child: BigText(
                      text: '.',
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  Container(
                    child: SmallText(text: 'Food pairing'),
                  )
                ],
              ),
            ),
            SizedBox(
              // height:1500,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  // content's not scrollable, we did this coz the parent is scrollable already
                  shrinkWrap: true,
                  // shrinkWrap makes the list occupy only the space it needs instead of taking the whole space
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.width10),
                      child: Row(
                        children: [
                          //  Image Container
                          Container(
                            height: Dimensions.height120,
                            width: Dimensions.height120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/pancakes.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white38,
                            ),
                          ),

                          //  Text Container
                          Expanded(
                            child: Container(
                              height: Dimensions.height100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimensions.radius30),
                                  bottomLeft: Radius.circular(Dimensions.radius30),
                                )
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(text: 'Mouth Watering Pancakes', color: AppColors.mainBlackColor,),
                                    SizedBox(height: Dimensions.height10,),
                                    SmallText(text: 'Served with natural honey'),
                                    SizedBox(height: Dimensions.height10,),
                                    Row(
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: 'Normal',
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: '1.7km',
                                            iconColor: AppColors.mainColor),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: '32min',
                                            iconColor: AppColors.iconColor2)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    //we use this method for scaling up and down

    Matrix4 matrix = new Matrix4.identity(); // provides x y z dimensions

    if (index == _currentPageValue) {
      var currentScale = 1 -
          (_currentPageValue - index) *
              (1 - _scaleFactor); //this always returns 1
      var currentTranslation = _height *
          (1 - currentScale) /
          2; //makes the container move up and down(messing with height)
      //  matrix=Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTranslation,
            0); //the setTranslationRaw is the one which moves the container up and down not the scaling
    } //condition for current page

    else if (index == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor +
          (_currentPageValue - index + 1) *
              (1 - _scaleFactor); //this always returns the scale factor (0.8)
      var currentTranslation = _height * (1 - currentScale) / 2;
      //  matrix=Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTranslation, 0);
    } //conditio for the next container

    else if (index == _currentPageValue.floor() - 1) {
      var currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor); //returns 0.8
      var currentTranslation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTranslation, 0);
    } //condition for the previous container

    else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    } //condition for others

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            // inner container to set content of the pages..if u want child container to take its own height, wrap it with stack widget
            height: Dimensions.PageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                image: DecorationImage(
                    image: AssetImage('assets/images/pizza.jpg'),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            // aligns at bottom center of the parent widget
            child: Container(
              // inner container to set content of the pages..if u want child container to take its own height, wrap it with stack widget
              height: Dimensions.PageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width25,
                  right: Dimensions.width25,
                  bottom: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0, //blurs the color
                        offset:
                            Offset(0, 5)) //x-axis=0, y-axis, go down 5 pixels
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.height15,
                    right: Dimensions.height15),
                child: AppColumn(text:'Hawaian Pizza',)
              ),
            ),
          )
        ],
      ),
    );
  }
}
