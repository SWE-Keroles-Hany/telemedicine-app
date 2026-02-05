import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const backGroundColor = Color(0xff0E1817);
  static const Color midnightTeal = Color(0xFF192424);
  static const Color deepTealGreen = Color(0xFF133532);

  static const white = Colors.white;
  static const black = Colors.black;
  static const yellow = Colors.yellow;
  static const red = Colors.red;
  static const darkBrown = Color(0xff3C2F2F);
  static const Color mediumGray = Color(0xFF6A6A6A);
  static const Color lightGray = Color(0xFFF3F4F6);
  static const Color grayF0 = Color.fromARGB(255, 226, 219, 219);
  static const Color teal_400 = Color(0xff2DD4BF);
  static const Color aquaMint = Color(0xff19E6D4);
  static const Color darkTeal = Color(0xFF133533);
  static const Color sageGreen = Color(0xFF9DB8B6);
  static const Color blueGray = Color(0xFF627188);
  static const Color charcoalBlack = Color(0xFF1B1E1E);
  static const Color darkGray = Color(0xFF272727);
  static const Color darkTealGreen = Color(0xFF1C2A29);

  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: backGroundColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
    ),

    textTheme: TextTheme(
      labelSmall: TextStyle(
        color: white,
        fontSize: 11.sp,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: mediumGray,
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        color: blueGray,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: black,
        fontSize: 16.sp,
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
