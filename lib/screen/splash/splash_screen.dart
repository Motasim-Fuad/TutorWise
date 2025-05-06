import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/assets/image_assets.dart';
import '../../screen_models/Controller/Splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final cpController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF), // Purple
              Color(0xFFDFC1C1), // Blue
            ],
          ),
        ),
        child: Center(
          child: RotationTransition(
            turns: cpController.rotationController,
            child: Image.asset(
              ImageAssets.splashScreen,
              height: height * 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
