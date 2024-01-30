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
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            height: 210,
            child: Image.asset(
              iconPath,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
