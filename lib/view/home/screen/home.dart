import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_1/core/functions/alert_exit_app.dart';
import 'package:task_1/view/home/screen/home_screen.dart';
import 'package:task_1/view/widget/home/custom_appbar.dart';
import 'package:task_1/view/widget/home/custom_bottom_navigation_bar_item.dart';

import '../controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return HomeController();
      },
      child: Scaffold(
          appBar: customAppBar,
          drawer: const Drawer(),
          bottomNavigationBar: Consumer<HomeController>(
            builder: (context, controller, child) => BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      controller.pages.length,
                      (index) {
                        return CustomBottomNavigationBarItem(
                          isActive:
                              controller.currentPage == index ? true : false,
                          icon: controller.icons[index],
                          onPressed: () {
                            controller.onPressedIcon(index);
                          },
                        );
                      },
                    ))),
          ),
          body: Consumer<HomeController>(
            builder: (context, controller, child) =>
                controller.pages[controller.currentPage],
          )),
    );
  }
}
