import 'package:get/get.dart';
import 'package:task_1/view/home/screen/home.dart';
import 'package:task_1/view/productdetails/screen/productdetails.dart';
import 'core/constant/app_routes.dart';

List<GetPage<dynamic>>? routes = [
  //================================ Home ===========================================
  GetPage(name: AppRoute.home, page: () => const Home()),
  //================================ ProductDetails ===========================================
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
];
