import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_1/core/constant/size.dart';
import 'package:task_1/core/shared/custom_button_cart.dart';
import 'package:task_1/view/home/controller/homescreen_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_text.dart';

class CustomCardProductHomeScreen extends StatelessWidget {
  final String productName;
  final String productId;
  final double rating;
  final String productImagePath;
  final double productPrice;
  const CustomCardProductHomeScreen(
      {Key? key,
      required this.productName,
      required this.rating,
      required this.productImagePath,
      required this.productPrice,
      required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      child: Card(
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.h, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 120.w,
                    child: CustomText(
                      text: productName,
                      color: AppColors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // SizedBox(
                  //   width: 40.w,
                  // ),
                  // const Icon(
                  //   Icons.favorite_outline,
                  // )
                ],
              ),
              Row(
                children: [
                  CustomText(
                    text: rating.toString(),
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  const Icon(
                    Icons.grade,
                    color: AppColors.yellow,
                    size: 19,
                  )
                ],
              ),
              Image.network(
                productImagePath,
                height: 150.h,
                // width: 100.w,
                fit: BoxFit.contain,
              ),
              Consumer<HomeScreenController>(
                builder: (context, controller, child) {
                  return Row(
                    children: [
                      CustomText(
                          text: "$productPrice\$",
                          color: AppColors.white,
                          fontSize: 16.sp),
                      const Spacer(),
                      controller.userProductsIdCart.contains(productId)
                          ? Container()
                          : CustomButtonCart(
                              color: AppColors.btnColor,
                              icon: Icons.add,
                              size: MySize.iconSizeMd,
                              onTap: () {
                                controller.addToCart(productId);
                              },
                            )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
