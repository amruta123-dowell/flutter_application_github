import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_project/home_controller.dart';
import 'package:get/get.dart';

class ShopTab extends StatelessWidget {
  const ShopTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return ListView.separated(
        itemCount: controller.shopItemList.length,
        padding: const EdgeInsets.only(top: 15, bottom: 500),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 200,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: SizedBox(
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(
                          color: Colors.black,
                        ))),
                        child: _LogoWidget(
                            logoImgUrl: controller.shopItemList[index]["logo"]),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Image.asset(
                            controller.shopItemList[index]["imageUrl"],
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                _BottomIconBar(
                  timeList: controller.formattedDateInTime(index),
                  noDays: controller.noDays,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 7,
          );
        },
      );
    });
  }
}

class _BottomIconBar extends StatelessWidget {
  final List<String> timeList;
  final int noDays;
  const _BottomIconBar({required this.timeList, required this.noDays});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: 120,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black),
                    right: BorderSide(
                      color: Colors.black,
                    ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/icons/shop.png",
                  height: 20,
                  color: Colors.black,
                ),
                Image.network(
                  "https://cdn.iconscout.com/icon/free/png-512/free-user-circle-plus-3605378-3005458.png",
                  height: 25,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black)),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.more_horiz,
                      size: 18,
                    ),
                  ),
                  Expanded(
                      child: Align(
                          child: timeList.isNotEmpty
                              ? TimeShower(spittedTime: timeList)
                              : Text("Expires in $noDays days."))),
                  SvgPicture.asset(
                    "assets/icons/share.svg",
                    height: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  final String logoImgUrl;
  const _LogoWidget({super.key, required this.logoImgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Image.asset(
        logoImgUrl,
        height: 25,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TimeShower extends StatelessWidget {
  final List<String> spittedTime;
  const TimeShower({super.key, required this.spittedTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 4; i++) ...[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            height: 18,
            width: 17,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.black)),
            child: Text(
              spittedTime[i],
              style: TextStyle(height: 0),
            ),
          ),
          if (i == 1)
            Container(
              color: Colors.white,
              height: 20,
              width: 10,
              child: SvgPicture.asset(
                "assets/icons/two_dot_icon.svg",
                fit: BoxFit.cover,
              ),
            ),
        ]
      ],
    );
  }
}
