import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: Colors.green.shade700),
  scaffoldBackgroundColor: Colors.grey.shade300,
  textTheme: const TextTheme(
    button: TextStyle(color: Colors.blue),
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
    ),
  ),
);
