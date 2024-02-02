// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String ButtonText;
  final void Function()? ontap;
  const CustomButton({super.key, required this.ButtonText, this.ontap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: ontap,
        child: Text(ButtonText),
      ),
    );
  }
}
