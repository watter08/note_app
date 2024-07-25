import 'package:flutter/material.dart';

class CustomCenterText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color? fontColor;
  const CustomCenterText(this.title, {
    super.key,
    required this.fontSize,
    required this.fontColor
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title, style: TextStyle(
        fontSize: fontSize,
        color: fontColor
      ),),
    );
  }
}