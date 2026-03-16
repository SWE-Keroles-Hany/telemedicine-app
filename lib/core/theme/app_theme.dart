import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: ColorManager.backGroundColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
    ),

    scaffoldBackgroundColor: ColorManager.backGroundColor,
  );
}
