import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_1/core/class/handling_dataview.dart';
import 'package:task_1/view/cart/controller/cart_controller.dart';
import 'package:task_1/view/widget/cart/custom_cart-card.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetBuilder<CartController>(
      builder: (controller) {
        return HandlingDataView(
            onRefresh: () async {
              controller.getUserProductsCart();
            },
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.productsCart.length,
              itemBuilder: (context, index) {
                return CustomCartCard(
                  productImage: controller.productsCart[index]['product'].image,
                  productName: controller.productsCart[index]['product'].title,
                  productPrice: controller.productsCart[index]['product'].price
                      .toString(),
                  productCount: controller.productsCart[index]['count'],
                  onTapAdd: () {
                    controller.increaseProductCartCount(
                        controller.productsCart[index]['product'].id.toString(),
                        int.parse(controller.productsCart[index]['count']),
                        index);
                  },
                  onTapRemove: () {
                    controller.decreaseOrRemoveProductCartCount(
                        controller.productsCart[index]['product'].id.toString(),
                        int.parse(controller.productsCart[index]['count']),
                        index);
                  },
                );
              },
            ));
      },
    );
  }
}
