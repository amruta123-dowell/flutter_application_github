import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_project/home_controller.dart';
import 'package:flutter_test_project/tabs/account_tab.dart';
import 'package:flutter_test_project/tabs/home_tab.dart';
import 'package:flutter_test_project/tabs/ontap_tab.dart';
import 'package:flutter_test_project/tabs/search_tab.dart';
import 'package:flutter_test_project/tabs/shop_tab.dart';
import 'package:flutter_test_project/widgets/bottom_nav_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: SvgPicture.asset("assets/icons/element_plus.svg",
              height: 10, width: 10, fit: BoxFit.scaleDown),
          title: Container(
              alignment: Alignment.center,
              child: Image.asset("assets/pay_img.png", height: 30)),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.account_balance_wallet_outlined),
            )
          ],
        ),
        body: GetBuilder<HomeController>(
          builder: (controller) {
            return controller.selectedBottomIndex == 1
                ? const SearchTab()
                : controller.selectedBottomIndex == 2
                    ? const OnTapTab()
                    : controller.selectedBottomIndex == 3
                        ? const ShopTab()
                        : controller.selectedBottomIndex == 4
                            ? const AccountTab()
                            : const HomeTab();
          },
        ),
        bottomNavigationBar: const BottomNavWidget());
  }
}
