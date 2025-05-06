
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tutorapp/repository/forget_password_repository.dart';
import 'package:tutorapp/utils/utils.dart';
import 'package:tutorapp/resources/routes/route_name.dart';

class ForgetPasswordScreenModel extends GetxController {
  final phoneController = TextEditingController().obs;
  RxBool loading = false.obs;

  RxString countryCode = '88'.obs;

  final _repo = ForgetPasswordRepository();

  void sendOtpForReset() {
    final phone = phoneController.value.text.trim();

    if (phone.isEmpty) {
      Utils.snackBar("Error", "Phone number cannot be empty");
      return;
    }

    // Concatenate country code
    final fullPhone = '${countryCode.value}$phone';

    loading.value = true;

    Map<String, dynamic> data = {
      'phone': fullPhone,
    };

    _repo.forgetpasswordApi(data).then((response) {
      loading.value = false;

      if (kDebugMode) {
        print("Response: $response");
      }

      if (response['statusCode'] == 200) {
        Utils.snackBar("Success", response['data']['message'] ?? "OTP sent successfully");

        // Pass full phone with country code
        Get.toNamed(RouteName.otpResetPasswordScreen, arguments: {'phone': fullPhone});
      } else {
        Utils.snackBar("Error", response['data']['message'] ?? "Failed to send OTP");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}

