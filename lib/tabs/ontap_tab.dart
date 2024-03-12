import 'package:flutter/material.dart';

class OnTapTab extends StatelessWidget {
  const OnTapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "NO TAP FOUND",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
