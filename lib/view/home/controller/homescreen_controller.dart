import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:task_1/core/class/sqldb.dart';
import 'package:task_1/core/class/status_request.dart';
import 'package:task_1/core/functions/show_snack_bar.dart';
import 'package:task_1/core/services/services.dart';
import 'package:task_1/core/shared/custom_text.dart';
import 'package:task_1/linkapi.dart';
import '../../../core/constant/app_routes.dart';
import '../../../core/functions/handling_datacontroller.dart';
import '../../../model/data/datasource/remote/home_data.dart';
import '../../../model/data/products_model.dart';

class HomeScreenController extends ChangeNotifier {
  final SqlDb sqlDb;
  final MyServices myServices;
  HomeData homeData;
  HomeScreenController(
      {required this.homeData, required this.sqlDb, required this.myServices}) {
    getData();
  }

  bool isLoading = false;
  int currectCategory = 0;
  StatusRequest statusRequest = StatusRequest.none;
  List categories = [];
  List userProductsIdCart = [];
  List<ProductsModel> products = [];
  // late final TextEditingController search;
  getCategories() async {
    statusRequest = StatusRequest.loading;
    notifyListeners();
    var response = await homeData.getData(AppLink.categories);
    print("================Controller_Response=====================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      categories.addAll(response);
    }
    notifyListeners();
  }

  getCategoryProducts() async {
    products.clear();
    isLoading = true;
    // statusRequest = StatusRequest.loading;
    notifyListeners();
    var response = await homeData
        .getData("${AppLink.categoryProducts}/${categories[currectCategory]}");
    print("================Controller_Response=====================$response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      List listData = response;
      products.addAll(listData.map((e) => ProductsModel.fromJson(e)));
    }
    isLoading = false;
    notifyListeners();
  }

  onRefresh() async {
    await getData();
  }

  goToPageProductDetails(ProductsModel productModel, BuildContext context) {
    // Get.toNamed(AppRoute.productDetails,
    //     arguments: {'productModel': productModel});
    Navigator.of(context).pushNamed(AppRoute.productDetails, arguments: {
      'productsModel': productModel,
      'homeScreenController': this
    });
  }

  selectCategory(int index) {
    currectCategory = index;
    getCategoryProducts();
    notifyListeners();
  }

  addToCart(String productID) async {
    statusRequest = StatusRequest.loading;
    notifyListeners();
    // await sqlDb.insertData(
    //     'insert into todo(title,note,color,date,starttime,endtime,status,repeat,remind) values ("titletest","notetest",0,"2023/12/5","09:00","09:10","TODO","20","Monthly")');
    int response = await sqlDb.insertData(
        'insert into cart(productid,quantity) values ("$productID","1")');
    print(
        "================================Response===========================$response");
    if (response > 0) {
      // Get.snackbar("Success", "Added To Cart");
      // showSnackBar(context, "Success", "Added To Cart");
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text("Success"),
      //         content: Text("Saved successfully"),
      //       );
      //     });
      await getUserProductsCart();
    } else {
      // Get.defaultDialog(
      //     title: "Warning", content: const Text("Something Went Wrong"));
    }
    statusRequest = StatusRequest.none;
    notifyListeners();
  }

  getUserProductsCart() async {
    // statusRequest = StatusRequest.loading;
    // update();
    userProductsIdCart.clear();
    List<Map> data = await sqlDb.readData('select * from cart');
    print(
        "==============================data============================$data");
    if (data.isNotEmpty) {
      data.forEach((element) {
        userProductsIdCart.add(element['productid']);
      });
    }
    print(
        "==============================userProductsIdCart============================$userProductsIdCart");
    // statusRequest = StatusRequest.none;
    notifyListeners();
  }

  getDataApi() async {
    await getCategories();
    if (categories.isNotEmpty) {
      await getCategoryProducts();
    }
  }

  getDataLocal() async {
    await getUserProductsCart();
  }

  getData() async {
    await getDataApi();
    getDataLocal();
  }
}
