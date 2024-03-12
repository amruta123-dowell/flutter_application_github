import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_project/home_controller.dart';
import 'package:flutter_test_project/widgets/account_details_widget.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        GetBuilder<HomeController>(builder: (controller) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.imageList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    AccountDetailsWidget(
                      sponsorsName: controller.imageList[index]
                          ["sponsorsName"]!,
                      userName: controller.imageList[index]["userName"]!,
                      userImage: controller.imageList[index]["userImage"]!,
                    ),
                    _ListItemWidget(
                        imageURl: controller.imageList[index]["imageUrl"] ?? '')
                  ],
                );
              });
        })
      ],
    );
  }
}

class _ListItemWidget extends StatelessWidget {
  final String imageURl;
  const _ListItemWidget({required this.imageURl});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
            constraints: const BoxConstraints(minHeight: 500, maxHeight: 800),
            width: double.infinity,
            child: Image.asset(
              imageURl,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/icons/control.png",
                        height: 29,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 17),
                      Container(
                        height: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.more_horiz,
                        ),
                      ),
                      const SizedBox(width: 17),
                      Image.asset(
                        "assets/icons/bookmark.png",
                        height: 22,
                        fit: BoxFit.contain,
                      ),
                    ]),
              ),
              SvgPicture.asset(
                "assets/icons/share.svg",
                height: 30,
              )
            ],
          ),
        )
      ],
    );
  }
}
