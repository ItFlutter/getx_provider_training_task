import 'package:flutter/material.dart';
import 'package:task_1/core/constant/app_routes.dart';
import 'package:task_1/view/home/screen/home.dart';
import 'package:task_1/view/productdetails/screen/productdetails.dart';

// List<GetPage<dynamic>>? routes = [
//   //================================ Home ===========================================
//   GetPage(name: AppRoute.home, page: () => const Home()),
//   //================================ ProductDetails ===========================================
//   GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
// ];
Map<String, Widget Function(BuildContext)> routes = {
  //================================ Home ===========================================
  AppRoute.home: (context) {
    return const Home();
  },
  //================================ ProductDetails ===========================================
  AppRoute.productDetails: (context) {
    return const ProductDetails();
  }
};
