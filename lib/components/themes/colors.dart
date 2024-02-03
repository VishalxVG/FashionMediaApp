import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(0, 0, 0, 1),
    centerTitle: true,
  ),
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(0, 0, 0, 1),
    primary: Color.fromRGBO(20, 33, 61, 1.000),
    secondary: Color.fromRGBO(252, 163, 17, 1.000),
    tertiary: Color.fromRGBO(27, 38, 59, 1),
    outline: Colors.white,
  ),
);
