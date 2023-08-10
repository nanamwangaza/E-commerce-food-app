import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class AppIcon extends StatelessWidget {

  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
  final double iconSize;

   AppIcon({
    super.key,
    required this.icon,
    this.iconColor=  Colors.black87,
    this.backgroundColor=const Color(0xFFfcf4e4),
    this.size=40,
    this.iconSize=16,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(
        icon,
         color:iconColor,
         size: iconSize,
         ),
    );
  }
}