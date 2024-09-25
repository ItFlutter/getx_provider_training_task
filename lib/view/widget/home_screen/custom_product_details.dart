import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
// import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:task_1/core/shared/custom_button.dart';
import 'package:task_1/view/home/controller/homescreen_controller.dart';
import 'package:task_1/view/productdetails/controller/productdetails_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_text.dart';

class CustomProductDetails extends StatelessWidget {
  final String productName;
  final String productId;
  final String productPrice;
  final String productRating;
  final String productDescription;
  final void Function()? onPressedAddToCart;
  const CustomProductDetails(
      {super.key,
      required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productRating,
      required this.productDescription,
      this.onPressedAddToCart});

  @override
  Widget build(BuildContext context) {
    HomeScreenController controller =
        Provider.of<HomeScreenController>(context, listen: false);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: AppColors.secondColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: productName,
            color: AppColors.white,
            fontSize: 19.sp,
            fontWeight: FontWeight.w500,
          ),
          CustomText(
            text: "$productPrice\$",
            color: AppColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          Row(
            children: [
              CustomText(
                text: productRating,
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
          const CustomText(
            text: "Product Details",
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
          Expanded(
            child: ListView(
              children: [
                ReadMoreText(
                  "$productDescription\t",
                  trimCollapsedText: "See More Detail",
                  trimExpandedText: "See Less Detail",
                  trimLines: 4,
                  trimMode: TrimMode.Line,
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                  colorClickableText: AppColors.btnColor,
                ),
              ],
            ),
          ),
          controller.userProductsIdCart.contains(productId)
              ? Container()
              : CustomButton(
                  text: "Add to Cart",
                  isActive: true,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: onPressedAddToCart,
                )
        ],
      ),
    );
  }
}
