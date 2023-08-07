import 'package:flutter/material.dart';
import 'package:food_app/pages/food/popular_food_detail.dart';
import 'package:food_app/pages/main_food_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home:PopularFoodDetail()
    );
  }
}
