import 'package:flutter/material.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "NO DETAILS FOUND",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
