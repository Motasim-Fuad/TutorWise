import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/repository/singup_repository.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import '../../../utils/utils.dart';

class SignUpScreenModel extends GetxController {
  final _api = SignUpRepository();

  final emailController_si = TextEditingController();
  final passwordController_si = TextEditingController();

  final emailFocusNode_si = FocusNode();
  final passwordFocusNode_si = FocusNode();

  RxBool loading = false.obs;



  void signupApi({
    required String userType,
    required String phone,
    required String username,
    required String password,
    required String confirmPassword,
  }) async {
    loading.value = true;

    Map<String, String> data = {
      "user_type": userType,
      "phone": phone,
      "username": username,
      "password": password,
      "confirm_password": confirmPassword,
    };

    try {
      final value = await _api.signupApi(data);
      loading.value = false;

      final responseData = value['data'];

      if (responseData["error"] != null) {
        Utils.snackBar("Register", responseData["error"]);
      } else {
        Utils.snackBar("Register", "Register Successful");
        emailController_si.clear();
        passwordController_si.clear();
        Get.toNamed(RouteName.otpScreen, arguments: {'phone': phone});
      }
    } catch (error) {
      loading.value = false;
      if (kDebugMode) {
        print("Signup Error: $error");
      }
      Utils.snackBar("Error", error.toString());
    }
  }


  @override
  void onClose() {
    emailController_si.dispose();
    passwordController_si.dispose();
    emailFocusNode_si.dispose();
    passwordFocusNode_si.dispose();
    super.onClose();
  }
}
