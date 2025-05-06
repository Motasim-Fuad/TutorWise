
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/repository/otp_reset_password_screen_Repository.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import 'package:tutorapp/utils/utils.dart';

class OtpResetPasswordScreenModel extends GetxController {
  final otp_restPasswordRepository = OtpResetPasswordScreenRepository();

  final otp1 = TextEditingController();
  final otp2 = TextEditingController();
  final otp3 = TextEditingController();
  final otp4 = TextEditingController();

  RxBool loading = false.obs;
  late String phone;

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments?['phone'] ?? "";
  }

  TextEditingController getOtpController(int index) {
    switch (index) {
      case 0: return otp1;
      case 1: return otp2;
      case 2: return otp3;
      case 3: return otp4;
      default: return TextEditingController();
    }
  }

  void verifyOtpfp() async {
    final otp = otp1.text + otp2.text + otp3.text + otp4.text;

    if (otp.length < 4) {
      Utils.snackBar("Error", "Please enter complete OTP");
      return;
    }

    loading.value = true;
    try {
      final response = await otp_restPasswordRepository.verifyOtpApirs({
        "phone": phone,
        "otp": otp
      });

      loading.value = false;


      if (response['statusCode'] == 200) {
        Utils.snackBar("Success", "OTP Verified Successfully");

        otp1.clear();
        otp2.clear();
        otp3.clear();
        otp4.clear();
        Get.toNamed(RouteName.setPassword, arguments: {"phone": phone});

      } else {
        Utils.snackBar("Error", response["message"] ?? "OTP verification failed");
      }
    } catch (e) {
      loading.value = false;
      Utils.snackBar("Error", e.toString());
    }
  }


  void resendOtpfp() async {
    loading.value = true;
    try {
      final response = await otp_restPasswordRepository.resendOtpApirs({"phone": phone});
      loading.value = false;
      Utils.snackBar("OTP", response["message"] ?? "OTP resent successfully");
    } catch (e) {
      loading.value = false;
      Utils.snackBar("Error", e.toString());
    }
  }

  @override
  void onClose() {
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    super.onClose();
  }
}
