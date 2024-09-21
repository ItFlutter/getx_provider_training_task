import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/shared/custom_text.dart';
import 'custom_add_and_remove_product.dart';

class CustomCartCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productCount;
  final void Function()? onTapAdd;
  final void Function()? onTapRemove;
  const CustomCartCard(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productCount,
      this.onTapAdd,
      this.onTapRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: Image.network(
                      productImage,
                      // height: 150.h,
                      width: 120.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: productName,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                    CustomText(
                      text: "$productPrice\$",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                    CustomAddAndRemoveProduct(
                      count: productCount,
                      onTapAdd: onTapAdd,
                      onTapRemove: onTapRemove,
                    )
                  ],
                )),
          ],
        )
        // child: ListTile(
        //   dense: true,
        //   // enabled: true,
        //   // isThreeLine: true,
        //   leading: Image.asset(
        //     "assets/images/test.png",
        //     // height: 150.h,
        //     width: 100.w,
        //     fit: BoxFit.fill,
        //   ),
        //   title: CustomText(
        //     text: "CosmicByte GS430 Wireless Headset",
        //     fontSize: 14.sp,
        //     fontWeight: FontWeight.w500,
        //   ),
        //   subtitle: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       CustomText(
        //         text: "99.00\$",
        //         fontSize: 14.sp,
        //         fontWeight: FontWeight.w500,
        //         color: AppColors.white,
        //       ),
        //       Row(
        //         mainAxisSize: MainAxisSize.min,
        //         children: [
        //           InkWell(
        //               onTap: () {},
        //               child: Container(
        //                   margin: EdgeInsets.only(right: 10.w, top: 10.h),
        //                   decoration: BoxDecoration(
        //                       color: AppColors.secondColor,
        //                       borderRadius: BorderRadius.circular(3)),
        //                   child: Icon(
        //                     Icons.remove,
        //                     size: 18,
        //                   ))),
        //           CustomText(
        //             text: "1",
        //             color: AppColors.white,
        //             fontSize: 18.sp,
        //           ),
        //           InkWell(
        //               onTap: () {},
        //               child: Container(
        //                   margin: EdgeInsets.only(left: 10.w, top: 10.h),
        //                   decoration: BoxDecoration(
        //                       color: AppColors.secondColor,
        //                       borderRadius: BorderRadius.circular(3)),
        //                   child: Icon(
        //                     Icons.add,
        //                     size: 18,
        //                   ))),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
