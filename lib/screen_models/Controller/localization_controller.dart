import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LocalizationController extends GetxController {
  RxBool language = true
      .obs; // true = English, false = Bangla.

  void flagChange() {
    language.value = !language.value;

    if (language.value) {
      Get.updateLocale(Locale("en", "US"));
    } else {
      Get.updateLocale(Locale("bn", "BD"));
    }
  }
}
