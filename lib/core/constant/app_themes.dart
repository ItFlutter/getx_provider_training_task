import "package:flutter/material.dart";
import 'app_colors.dart';

ThemeData appTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        // color: AppColors.primaryColor,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        // fontFamily: "Muli"
      ),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.white),
      headlineLarge: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 28, color: AppColors.white),
      bodyMedium: TextStyle(
          height: 1.7,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15),
      bodySmall: TextStyle(height: 1.7, color: AppColors.grey, fontSize: 15),
    ));
