import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen_models/services/splash_services.dart';


class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController rotationController;

  final splashServices = SplashServices();

  @override
  void onInit() {
    super.onInit();

    rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    Future.delayed(const Duration(seconds: 3), () {
      rotationController.stop();
      splashServices.isLogin();
    });
  }

  @override
  void onClose() {
    rotationController.dispose();
    super.onClose();
  }
}
