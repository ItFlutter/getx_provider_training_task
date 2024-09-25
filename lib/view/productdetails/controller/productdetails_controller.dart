import 'package:flutter/material.dart';
import 'package:task_1/view/home/controller/homescreen_controller.dart';
import '../../../core/class/status_request.dart';
import '../../../model/data/products_model.dart';

class ProductDetailsController extends ChangeNotifier {
  final ProductsModel productModel;
  ProductDetailsController({required this.productModel});
  StatusRequest statusRequest = StatusRequest.none;
  // SqlDb sqlDb = Get.find();
  addToCart(String productId, HomeScreenController homeScreenController) async {
    statusRequest = StatusRequest.loading;
    // notifyListeners();
    await homeScreenController.addToCart(productId);
    statusRequest = StatusRequest.none;
    // notifyListeners();
  }
}
