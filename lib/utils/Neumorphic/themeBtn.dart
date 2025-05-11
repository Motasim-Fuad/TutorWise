import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen_models/services/theme_screen_model.dart';


class NeumorphicThemeToggleButton extends StatelessWidget {
  NeumorphicThemeToggleButton({super.key});

  final ThemeScreenModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        NeumorphicButton(
          onPressed: controller.toggleTheme,
          padding: const EdgeInsets.all(16),
          style: NeumorphicStyle(
            shape: NeumorphicShape.concave, // concave, convex, or flat
            boxShape: const NeumorphicBoxShape.circle(), // round button
           // depth: 6, // positive = raised, negative = inset
            depth: controller.isDarkMode.value ? -10: 10,
            intensity: 1, // 0 to 1 (soft to strong shadow)//0.3,0.6,0.8
            surfaceIntensity: 0.2,
            lightSource: LightSource.topLeft, // light direction
            color: controller.isDarkMode.value ? const Color(0xFF3E3E3E) : const Color(0xFFE0E0E0),
            shadowLightColor: Colors.white70,
            shadowDarkColor: Colors.black54,
          ),
          child: Icon(
            controller.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
            color: controller.isDarkMode.value ? Colors.amberAccent : Colors.deepPurple,
            size: 30,
          ),
        )


    );
  }
}
