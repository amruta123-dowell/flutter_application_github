import 'package:flutter/material.dart';
import 'package:flutter_test_project/home_controller.dart';
import 'package:get/get.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: controller.selectedBottomIndex,
          backgroundColor: Colors.white,
          onTap: (int value) {
            controller.changeBottomNavItem(value);
          },
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: ''),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.black,
                ),
                label: ''),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.touch_app_outlined,
                  size: 25,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/shop.png",
                  height: 20,
                  color: Colors.black,
                ),
                label: ''),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                  color: Colors.black,
                ),
                label: ''),
          ]);
    });
  }
}
