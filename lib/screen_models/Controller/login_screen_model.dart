import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tutorapp/models/user_model.dart';
import 'package:tutorapp/repository/login_repository.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import 'package:tutorapp/screen_models/Controller/user_preference.dart';
import 'package:tutorapp/utils/utils.dart';

class LoginScreenModel extends GetxController{

  final _api=LoginRepository();

  UserPreferences userPreferences =UserPreferences();

  final phoneController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;
  RxString countryCode = '88'.obs;

  final phoneFocusNode=FocusNode().obs;
  final passwordFocusNode=FocusNode().obs;

  RxBool rememberMe = false.obs;
  RxBool loading =false.obs;


  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void loginApi() {
    loading.value = true;

    Map data = {
      "phone": "${countryCode.value}${phoneController.value.text.trim()}",
      "password": passwordController.value.text,
    };

    _api.loginApi(data).then((response) {
      loading.value = false;

      if (kDebugMode) print("Login API response: $response");

      final statusCode = response['statusCode'];
      final data = response['data'];

      if (statusCode == 200) {
        final token = data["token"];
        final userType = data["user_type"];




        if (token == null || userType == null) {
          Utils.snackBar("Login Failed", data['message'] ?? "Invalid response");
          return;
        }

        UserModel userModel = UserModel(
          token: token,
          userType: userType,
          isLogin: true,

        );

        if (kDebugMode) {
          print("Saving user -> token: $token, userType: $userType,");
        }

        userPreferences.saveUser(userModel).then((_) {
          switch (userModel.userType.toLowerCase()) {
            case 'tutor':
              Get.toNamed(RouteName.tutorScreen);
              break;
            case 'student':
              Get.toNamed(RouteName.studentScreen);
              break;
            case 'referrer':
              Get.toNamed(RouteName.referrerScreen);
              break;
            default:
              Utils.snackBar("Login", "Unknown user type.");
          }

          phoneController.value.clear();
          passwordController.value.clear();
        });

        Utils.snackBar("Login", data['message'] ?? "Login successful!");
      } else {
        Utils.snackBar("Error", data['message'] ?? "Login failed");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      if (kDebugMode) print("Login error: $error");
      Utils.snackBar("Error", "Something went wrong");
    });
  }






}