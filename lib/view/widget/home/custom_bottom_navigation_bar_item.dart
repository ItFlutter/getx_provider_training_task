import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final void Function()? onPressed;
  final bool isActive;
  final IconData? icon;

  const CustomBottomNavigationBarItem(
      {Key? key, this.onPressed, required this.isActive, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Container(
            padding: EdgeInsets.all(7.h),
            decoration: BoxDecoration(
                color: isActive ? AppColors.btnColor : AppColors.transparent,
                borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: AppColors.white)));
    ;
  }
}
