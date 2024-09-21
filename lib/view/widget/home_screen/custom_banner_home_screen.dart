import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_imageasset.dart';
import '../../../core/shared/custom_text.dart';
import 'custom_effect_in_banner.dart';

class CustomBannerHomeScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomBannerHomeScreen(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Image.asset(
          AppImageAsset.bannerHome,
          height: 135.h,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Positioned(
            right: -10.w, top: -150.h, child: const CustomEffectInBanner()),
        Positioned(
            // right: -10,
            bottom: -170.h,
            child: const CustomEffectInBanner()),
        Positioned(
            top: 30.h,
            left: 20.w,
            child: CustomText(
              text: title,
              color: AppColors.white,
              fontSize: 15.sp,
            )),
        Positioned(
            top: 50.h,
            left: 20.w,
            child: CustomText(
              text: subTitle,
              color: AppColors.white,
              fontSize: 30.sp,
            )),
      ],
    );
  }
}
