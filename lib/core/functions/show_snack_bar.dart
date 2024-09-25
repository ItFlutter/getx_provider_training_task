import 'package:flutter/material.dart';
import 'package:task_1/core/shared/custom_text.dart';

showSnackBar(context, String title, String content) {
  var snackBar = SnackBar(
      content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      CustomText(
        text: title,
      ),
      CustomText(
        text: content,
      ),
    ],
  ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
