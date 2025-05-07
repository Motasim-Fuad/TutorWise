import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
              Color(0xFF000000), // Purple
              Color(0xFF070707), // Blue
            ],
          ),
        ),
        child: Center(
          child: RotationTransition(
            turns: cpController.rotationController,
            child: Lottie.asset("assets/images/AnimationSplash.json",
              width: 500,
              height: 500,
              fit: BoxFit.contain,
              repeat: true,
              reverse: false,
              animate: true,

            ),
          ),
        ),
      ),
    );
  }
}
