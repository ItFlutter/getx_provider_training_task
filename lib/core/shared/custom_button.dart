import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_1/core/constant/size.dart';
import 'package:task_1/core/shared/custom_text.dart';
import '../constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  final double? minWidth;
  final String text;
  final void Function()? onPressed;
  final bool isActive;
  const CustomButton(
      {Key? key,
      required this.text,
      this.onPressed,
      required this.isActive,
      this.minWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      onPressed: onPressed,
      color: isActive ? AppColors.btnColor : AppColors.secondColor,
      elevation: 10,
      height: 40.h,
      shape: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(MySize.borderRadiusMd)),
      child: CustomText(text: text),
    );
  }
}
