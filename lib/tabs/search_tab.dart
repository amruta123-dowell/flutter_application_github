import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(
        "NO SEARCH FOUND",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
