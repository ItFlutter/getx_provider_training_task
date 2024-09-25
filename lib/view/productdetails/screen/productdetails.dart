import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_1/core/class/crud.dart';
import 'package:task_1/core/class/handling_dataview.dart';
import 'package:task_1/core/class/sqldb.dart';
import 'package:task_1/core/constant/app_colors.dart';
import 'package:task_1/core/services/services.dart';
import 'package:task_1/model/data/datasource/remote/home_data.dart';
import 'package:task_1/model/data/products_model.dart';
import 'package:task_1/view/home/controller/homescreen_controller.dart';
import '../../widget/home_screen/custom_product_details.dart';
import '../controller/productdetails_controller.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
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
          body: ChangeNotifierProvider<ProductDetailsController>(
            create: (context) {
              return ProductDetailsController(
                productModel: args['productsModel'],
              );
            },
            child: Consumer<ProductDetailsController>(
              builder: (context, controller, child) {
                return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Column(children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        width: MediaQuery.of(context).size.width,
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
                        productDescription:
                            controller.productModel.description!,
                        productName: controller.productModel.title!,
                        productPrice: controller.productModel.price.toString(),
                        productRating:
                            controller.productModel.rating!.rate.toString(),
                        onPressedAddToCart: () {
                          // controller.homeScreenController
                          // .addToCart(controller.productModel.id.toString());
                          controller.addToCart(
                              controller.productModel.id.toString(),
                              Provider.of<HomeScreenController>(context,
                                  listen: false));
                        },
                      )),
                    ]),
                    onRefresh: () async {});
              },
            ),
          )),
    );
  }
}
