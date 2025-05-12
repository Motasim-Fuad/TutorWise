import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen_models/services/theme_screen_model.dart';


class TutorHomeScreen extends StatelessWidget {
  final ThemeScreenModel themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme Switch")),
      body: Center(
        child: Obx(() => Switch(
          value: themeController.isDarkMode,
          onChanged: (value) => themeController.toggleTheme(),
        )),
      ),
    );
  }
}
