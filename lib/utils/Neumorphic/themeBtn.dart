import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen_models/services/theme_screen_model.dart';

class NeumorphicThemeToggleButton extends StatelessWidget {
  NeumorphicThemeToggleButton({super.key});

  final ThemeScreenModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => NeumorphicButton(
      onPressed: controller.toggleTheme,
      padding: const EdgeInsets.all(16),
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: const NeumorphicBoxShape.circle(),
        depth: controller.isDarkMode ? -10 : 10,
        intensity: 1,
        surfaceIntensity: 0.2,
        lightSource: LightSource.topLeft,
        color: controller.isDarkMode
            ? const Color(0xFF3E3E3E)
            : const Color(0xFFE0E0E0),
        shadowLightColor: Colors.white70,
        shadowDarkColor: Colors.black54,
      ),
      child:  Icon(
    controller.themeMode.value == ThemeMode.dark
    ? Icons.dark_mode
        : controller.themeMode.value == ThemeMode.light
    ? Icons.light_mode
        : Icons.brightness_auto,
      color: controller.themeMode.value == ThemeMode.dark
          ? Colors.amberAccent
          : controller.themeMode.value == ThemeMode.light
          ? Colors.deepPurple
          : Colors.blueGrey,
      size: 30,
    ),

    ));
  }
}
