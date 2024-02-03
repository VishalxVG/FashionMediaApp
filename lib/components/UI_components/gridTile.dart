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
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          iconPath,
          height: 250,
        ),
      ],
    );
  }
}
