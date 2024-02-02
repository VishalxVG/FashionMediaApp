// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyGridTile extends StatelessWidget {
  final int index;
  final String title;
  final String iconPath;
  const MyGridTile({
    super.key,
    required this.index,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          Image.asset(
            iconPath,
            height: 250,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
