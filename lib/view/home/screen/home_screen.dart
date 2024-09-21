import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_1/core/class/handling_dataview.dart';
import 'package:task_1/core/class/sqldb.dart';
import 'package:task_1/core/class/status_request.dart';
import 'package:task_1/core/functions/remove_image_background.dart';
import 'package:task_1/core/shared/custom_text.dart';
import 'package:task_1/view/home/controller/homescreen_controller.dart';
import 'package:task_1/view/widget/home_screen/custom_banner_home_screen.dart';
import 'package:task_1/core/shared/custom_button.dart';
import 'package:task_1/view/widget/home_screen/custom_card_product_home_screen.dart';
import 'package:task_1/view/widget/home_screen/custom_text_form_field_search.dart';
import '../../../core/constant/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) {
        return HandlingDataView(
            onRefresh: () async {
              await controller.onRefresh();
            },
            statusRequest: controller.statusRequest,
            widget: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomText(
                      text: "Discover Your Best",
                      fontSize: 20.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomTextFormFieldSearch(
                    controller: controller.search,
                    fillColor: AppColors.secondColor,
                    hintText: "Search Product",
                    onChanged: (String currentInput) {
                      // SqlDb().mydeleteDatabase();
                    },
                    onPressedPrefixIcon: () {},
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const CustomBannerHomeScreen(
                      title: "A Summer Surprise", subTitle: "Discount 80%"),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: List.generate(
                    controller.categories.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: CustomButton(
                        text: controller.categories[index],
                        isActive:
                            controller.currectCategory == index ? true : false,
                        onPressed: () {
                          controller.selectCategory(index);
                        },
                      ),
                    ),
                  )),
                ),
                SizedBox(
                  height: 10.h,
                ),
                controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.btnColor,
                      ))
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: List.generate(
                                controller.products.length,
                                (index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: InkWell(
                                        onTap: () {
                                          controller.goToPageProductDetails(
                                              controller.products[index]);
                                        },
                                        child: CustomCardProductHomeScreen(
                                            productId: controller
                                                .products[index].id
                                                .toString(),
                                            productName: controller
                                                .products[index].title!,
                                            rating: controller
                                                .products[index].rating!.rate!,
                                            productImagePath: controller
                                                .products[index].image!,
                                            productPrice: controller
                                                .products[index].price!),
                                      ),
                                    ))),
                      )
              ],
            ));
      },
    );
  }
}
