import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  // final int? maxLines;
  final bool isVisible;
  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.isVisible = false,
    // this.maxLines
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        // maxLines: maxLines,
        overflow: isVisible ? TextOverflow.visible : TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: fontWeight, fontSize: fontSize, color: color));
  }
}
