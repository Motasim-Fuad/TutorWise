import 'package:flutter/material.dart';
import '../resources/colors/app_color.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.background,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColor.textDark, fontSize: 24),
      bodyLarge: TextStyle(color: AppColor.textDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.textLight,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColor.secondary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColor.textLight, fontSize: 24),
      bodyLarge: TextStyle(color: AppColor.textLight),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.secondary,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
