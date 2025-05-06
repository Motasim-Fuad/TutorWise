import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import 'package:tutorapp/utils/utils.dart';

import '../../../repository/setpassword_repository.dart';

class SetPasswordScreenModel extends GetxController {
  final password_reset1 = TextEditingController().obs;
  final password_reset2 = TextEditingController().obs;

  final fn_password_reset1 = FocusNode().obs;
  final fn_password_reset2 = FocusNode().obs;

  RxBool loading = false.obs;

  late String phone; // Must be passed from previous screen

  final _setPasswordRepository = SetPasswordRepository();

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments?['phone'] ?? "";
  }

  void clearTextFields() {
    password_reset1.value.clear();
    password_reset2.value.clear();
  }

  void resetPassword() async {
    final pass1 = password_reset1.value.text;
    final pass2 = password_reset2.value.text;

    if (pass1.isEmpty || pass2.isEmpty) {
      Utils.snackBar("Error", "Please fill in both password fields");
      return;
    }

    // if (pass1.length < 6) {
    //   Utils.snackBar("Error", "Password must be at least 6 characters long");
    //   return;
    // }

    if (pass1 != pass2) {
      Utils.snackBar("Error", "Passwords do not match");
      return;
    }

    loading.value = true;

    try {
      final response = await _setPasswordRepository.setPasswordApi({
        "phone": phone,
        "password": pass1,
        "confirm_password": pass2,
      });

      loading.value = false;


      if (response['statusCode'] == 200) {
        Utils.snackBar("Success", "Password has been reset");
        clearTextFields();
        Get.offAllNamed(RouteName.loginScreen);

      } else {
        Utils.snackBar("Error", response["message"] ?? "Reset failed");
      }
    } catch (e) {
      loading.value = false;
      Utils.snackBar("Error", e.toString());
    }
  }
}
