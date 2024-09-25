import 'package:flutter/material.dart';
import '../../../core/class/sqldb.dart';
import '../../../core/class/status_request.dart';
import '../../../core/functions/handling_datacontroller.dart';
import '../../../core/services/services.dart';
import '../../../linkapi.dart';
import '../../../model/data/datasource/remote/cart_data.dart';
import '../../../model/data/products_model.dart';

class CartController extends ChangeNotifier {
  SqlDb sqlDb;
  CartData cartData;
  MyServices myServices;
  CartController(
      {required this.cartData, required this.sqlDb, required this.myServices}) {
    getUserProductsCart();
  }
  bool isLoading = false;
  int currectCategory = 0;
  StatusRequest statusRequest = StatusRequest.none;
  List<Map> cart = [];
  List products = [];
  List<Map<String, dynamic>> productsCart = [];
  Map productsAndCounts = {};
  // List<CartModel> cart = [];
  getUserProductsCart() async {
    statusRequest = StatusRequest.loading;
    notifyListeners();
    cart = await sqlDb.readData('select * from cart');
    print(
        "==============================cart============================$cart");
    if (cart.isNotEmpty) {
      cart.forEach((element) {
        getProductsCart(element['productid'], element['quantity']);
      });
    }
    // statusRequest = StatusRequest.none;

    notifyListeners();
  }

  // getUserCart() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await cartData.getData("${AppLink.userCart}/2");
  //   print("================Controller_Response=====================$response");
  //   statusRequest = handlingData(response);
  //   if (statusRequest == StatusRequest.success) {
  //     cart.addAll(response);

  //     if (cart[0]['products'].isNotEmpty) {
  //       cart.forEach((e) {
  //         products.addAll(e['products']);
  //       });
  //       products.forEach((element) {
  //         getProductsCart(element['productId'], element['quantity']);
  //       });
  //     }
  //   }
  //   update();
  // }
  increaseProductCartCount(String id, int quantity, int index) async {
    statusRequest = StatusRequest.loading;
    notifyListeners();

    int response = await sqlDb.updateData(
        "update cart set quantity='${quantity + 1}' where productid=$id");
    print(
        "================================Response===========================$response");
    if (response > 0) {
      // Get.snackbar("Success", "Increased One");
      productsCart[index]['count'] =
          (int.parse(productsCart[index]['count']) + 1).toString();
      // getData();
    } else {
      // Get.defaultDialog(
      //     title: "Warning", content: const Text("Something Went Wrong"));
    }
    statusRequest = StatusRequest.none;
    notifyListeners();
  }

  decreaseOrRemoveProductCartCount(String id, int quantity, int index) async {
    statusRequest = StatusRequest.loading;
    notifyListeners();
    if (quantity == 1) {
      int response =
          await sqlDb.deleteData("delete from cart where productid=$id");
      productsCart.removeAt(index);
      print(
          "================================ResponseDelete===========================$response");
    } else {
      int response = await sqlDb.updateData(
          "update cart set quantity='${quantity - 1}' where productid=$id");
      print(
          "================================Response===========================$response");
      if (response > 0) {
        // Get.snackbar("Success", "Decreased One");
        productsCart[index]['count'] =
            (int.parse(productsCart[index]['count']) - 1).toString();
        // getData();
      } else {
        // Get.defaultDialog(
        //     title: "Warning", content: const Text("Something Went Wrong"));
      }
    }
    statusRequest = StatusRequest.none;
    notifyListeners();
  }

  getProductsCart(String productId, int quantity) async {
    // isLoading = true;
    // statusRequest = StatusRequest.loading;
    // update();
    var response =
        await cartData.getData("${AppLink.userProductsCart}/$productId");
    print("================Controller_Response=====================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      productsCart.add({
        'product': ProductsModel.fromJson(response),
        'count': quantity.toString()
      });
      print("========================product==============$productsCart");
      if (productsCart.length == cart.length) {
        statusRequest = StatusRequest.none;
        notifyListeners();
      }
    }
    // isLoading = false;
    // update();
  }
}
