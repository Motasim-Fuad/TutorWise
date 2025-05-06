import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeScreenModel extends GetxController {
  var isDarkMode = false.obs;

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(theme);
  }
}
