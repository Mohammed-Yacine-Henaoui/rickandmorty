import 'package:flutter/material.dart';

ThemeData myTheme() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFF353A40),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFFfec107),
      titleTextStyle: TextStyle(
          color: Color(0xFF382D0F), fontWeight: FontWeight.bold, fontSize: 22),
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(color: Color(0xFFE6E6E4), fontSize: 19),
    ),
  );
}
