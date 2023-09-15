import 'package:flutter/material.dart';
import 'package:messaging_app/core/colors.dart';

class RegularTextWidget extends StatelessWidget {
  final Color? color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration? decoration;
  const RegularTextWidget({super.key, 
  required this.text,
   this.color = AppColors.whiteThemeColor,
   this.decoration,
   this.fontSize = 14.0,
   this.fontWeight = FontWeight.w400,
   });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color,fontWeight: fontWeight, fontSize:  fontSize ),
    );
  }
}
