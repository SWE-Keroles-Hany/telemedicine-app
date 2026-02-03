import 'package:flutter/material.dart';

class AppTheme {
  static const backGroundColor = Color(0xffF9FAFB);
  static const white = Colors.white;
  static const black = Colors.black;
  static const yellow = Colors.yellow;
  static const red = Colors.red;
  static const darkBrown = Color(0xff3C2F2F);
  static const Color mediumGray = Color(0xFF6A6A6A);
  static const Color lightGray = Color(0xFFF3F4F6);
  static const Color grayF0 = Color.fromARGB(255, 226, 219, 219);

  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: backGroundColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
    ),

    textTheme: TextTheme(
      labelSmall: TextStyle(
        color: white,
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: mediumGray,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        color: mediumGray,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),

    scaffoldBackgroundColor: backGroundColor,
  );
}
