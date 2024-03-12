import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountDetailsWidget extends StatelessWidget {
  final String userName;
  final String sponsorsName;
  final String userImage;
  const AccountDetailsWidget(
      {required this.sponsorsName,
      required this.userName,
      super.key,
      required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                SvgPicture.asset(
                  userImage,
                  height: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "User Name",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                              height: 0),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Color.fromARGB(255, 212, 79, 8),
                          size: 17,
                        ),
                      ],
                    ),
                    Text(
                      "Rider Pro",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0,
                          height: 0),
                    )
                  ],
                )
              ],
            ),
          ),
          InkWell(
            child: Container(
              height: 20,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.black),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Follow",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
