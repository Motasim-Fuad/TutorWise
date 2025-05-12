import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeScreenModel extends GetxController {
  var themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPrefs();
  }

  ThemeMode get theme => themeMode.value;

  void toggleTheme() async {
    if (themeMode.value == ThemeMode.system) {
      themeMode.value = ThemeMode.light;
    } else if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.system;
    }

    Get.changeThemeMode(themeMode.value);
    saveThemeToPrefs();
  }

  Future<void> saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode', themeMode.value.toString());
  }

  Future<void> loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('theme_mode');

    switch (savedTheme) {
      case 'ThemeMode.light':
        themeMode.value = ThemeMode.light;
        break;
      case 'ThemeMode.dark':
        themeMode.value = ThemeMode.dark;
        break;
      case 'ThemeMode.system':
      default:
        themeMode.value = ThemeMode.system;
    }

    Get.changeThemeMode(themeMode.value);
  }

  bool get isDarkMode => themeMode.value == ThemeMode.dark;
}
