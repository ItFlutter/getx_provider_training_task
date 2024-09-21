import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_1/core/class/handling_dataview.dart';
import 'package:task_1/core/constant/app_colors.dart';
import '../../widget/home_screen/custom_product_details.dart';
import '../controller/productdetails_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            AppColors.beginLinear,
            AppColors.endLinear,
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(),
          body: GetBuilder<ProductDetailsController>(
            builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Column(children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      width: Get.width,
                      // decoration: BoxDecoration(color: AppColors.white),
                      child: Image.network(
                        controller.productModel.image!,
                        width: 300.w,
                        height: 300.h,
                        fit: BoxFit.contain,
                      ),
                    )),
                    Expanded(
                        child: CustomProductDetails(
                      productId: controller.productModel.id.toString(),
                      productDescription: controller.productModel.description!,
                      productName: controller.productModel.title!,
                      productPrice: controller.productModel.price.toString(),
                      productRating:
                          controller.productModel.rating!.rate.toString(),
                      onPressedAddToCart: () {
                        // controller.homeScreenController
                        // .addToCart(controller.productModel.id.toString());
                        controller
                            .addToCart(controller.productModel.id.toString());
                      },
                    )),
                  ]),
                  onRefresh: () async {});
            },
          )),
    );
  }
}
