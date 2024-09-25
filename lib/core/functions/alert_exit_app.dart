// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../constant/app_colors.dart';

// Future<bool> alertExitApp() {
//   Get.defaultDialog(
//       title: "warning",
//       middleText: "Do You Want To Exit The app",
//       actions: [
//         ElevatedButton(
//             style:
//                 ElevatedButton.styleFrom(backgroundColor: AppColors.btnColor),
//             onPressed: () {
//               exit(0);
//             },
//             child: const Text("Confirm")),
//         ElevatedButton(
//             style:
//                 ElevatedButton.styleFrom(backgroundColor: AppColors.btnColor),
//             onPressed: () {
//               Get.back();
//             },
//             child: const Text("Cancel")),
//       ]);
//   return Future.value(true);
// }
//     // Get.defaultDialog(
//     //           title: "47".tr,
//     //           middleText: "48".tr,
//     //           onConfirm: () {
//     //             exit(0);
//     //           },
//     //           onCancel: () {},
//     //           titleStyle: const TextStyle(color: AppColors.primaryColor),
//     //           confirmTextColor: AppColors.backgroundColor,
//     //           cancelTextColor: AppColors.secondaryColor,
//     //           buttonColor: AppColors.primaryColor,
//     //         );
//     //         return Future.value(true);
