
import 'dart:async';

import 'package:get/get.dart';
import 'package:tutorapp/resources/routes/route_name.dart';

import '../Controller/user_preference.dart';


class SplashServices{
  UserPreferences userPreferences=UserPreferences();

  void isLogin() {
    userPreferences.getUser().then((value) {
      print("Token: ${value.token}");
      print("Is Logged In: ${value.isLogin}");
      print("User Type: ${value.userType}");
      print("studenid: ${value.studentId}");

      if (value.isLogin == false || value.token.isEmpty) {
        Timer(Duration(seconds: 3), () {
          Get.offNamed(RouteName.loginScreen);
        });
      } else {
        // Navigate based on user type
        Timer(Duration(seconds: 3), () {
          switch (value.userType.toLowerCase()) {
            case 'tutor':
              Get.offNamed(RouteName.tutorScreen);
              break;
            case 'student':
              Get.offNamed(RouteName.studentScreen);
              break;
            case 'referrer':
              Get.offNamed(RouteName.referrerScreen);
              break;
            default:
              Get.offNamed(RouteName.loginScreen);
          }
        });
      }
    });
  }


}