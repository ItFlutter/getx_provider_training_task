import 'package:flutter/material.dart';
import 'package:task_1/view/home/screen/home_screen.dart';
import 'package:task_1/view/settings/screen/settings.dart';
import '../../cart/screen/cart.dart';

class HomeController extends ChangeNotifier {
  int currentPage = 0;
  List<Widget> pages = const [HomeScreen(), Cart(), Settings()];
  List<IconData> icons = const [
    Icons.home_outlined,
    Icons.shopping_cart_outlined,
    Icons.person_outline
  ];
  onPressedIcon(int index) {
    currentPage = index;
    notifyListeners();
  }
}
