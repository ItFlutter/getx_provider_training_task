import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_button_cart.dart';
import '../../../core/shared/custom_text.dart';

class CustomAddAndRemoveProduct extends StatelessWidget {
  final void Function()? onTapAdd;
  final void Function()? onTapRemove;
  final String count;
  const CustomAddAndRemoveProduct(
      {Key? key, this.onTapAdd, this.onTapRemove, required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10.w, top: 10.h),
          child: CustomButtonCart(
            color: AppColors.secondColor,
            icon: Icons.remove,
            size: 18,
            onTap: onTapRemove,
          ),
        ),
        CustomText(
          text: count,
          color: AppColors.white,
          fontSize: 18.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w, top: 10.h),
          child: CustomButtonCart(
            color: AppColors.secondColor,
            icon: Icons.add,
            size: 18,
            onTap: onTapAdd,
          ),
        )
      ],
    );
  }
}
