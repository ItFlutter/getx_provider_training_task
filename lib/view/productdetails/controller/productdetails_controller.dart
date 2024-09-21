import 'package:get/get.dart';
import 'package:task_1/view/home/controller/homescreen_controller.dart';
import '../../../core/class/status_request.dart';
import '../../../model/data/products_model.dart';

class ProductDetailsController extends GetxController {
  late ProductsModel productModel;
  StatusRequest statusRequest = StatusRequest.none;
  // SqlDb sqlDb = Get.find();
  HomeScreenController homeScreenController = Get.find();
  addToCart(String productId) async {
    statusRequest = StatusRequest.loading;
    update();
    await homeScreenController.addToCart(productId);
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    productModel = Get.arguments['productModel'];
    // TODO: implement onInit
    super.onInit();
  }
}
