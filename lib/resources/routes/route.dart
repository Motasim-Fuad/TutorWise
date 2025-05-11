import 'package:get/get.dart';
import 'package:tutorapp/screen/Authentacation/forget_password/otp_reset_pass.dart';
import 'package:tutorapp/screen/Authentacation/forget_password/set_password.dart';
import 'package:tutorapp/screen/Authentacation/singup/singup_form/otp_screen.dart';
import 'package:tutorapp/screen/Student/student_profile/student_edit_profile_Screen/student_edit_profile_Screen.dart';
import 'package:tutorapp/screen/Student/student_screen.dart';
import 'package:tutorapp/screen/Tutor/tutor_Screen.dart';
import 'package:tutorapp/screen/referrer/referrer_screen.dart';
import '../../screen/Authentacation/forget_password/forget_password.dart';
import '../../screen/Authentacation/login/login_screen.dart';
import '../../screen/Authentacation/singup/singupScreen.dart';
import '../../screen/Student/St_PostTutionScreen.dart';
import '../../screen/Student/st_my_activity/my_activity.dart';
import '../../screen/Student/student_profile/student_edit_profile_Screen/student_personal_details_screen.dart';
import '../../screen/Student/student_profile/student_profile.dart';
import '../../screen/splash/splash_screen.dart';
import 'route_name.dart';

class AppRoutes {

  static appRoutes ()=>[

   GetPage(
      name: RouteName.splashScreen,
      page: ()=> SplashScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
      name: RouteName.loginScreen,
      page: ()=> LoginScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
      name: RouteName.singupScreen,
      page: ()=> SignUpScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RouteName.otpResetPasswordScreen,
      page: ()=> OtpResetPasswordScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RouteName.setPassword,
      page: ()=> SetPassword(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RouteName.otpScreen,
      page: ()=> OtpScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
      name: RouteName.forgetpassScreen,
      page: ()=> ForgetPassword(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),

   GetPage(
      name: RouteName.tutorScreen,
      page: ()=> TutorScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RouteName.studentScreen,
      page: ()=> StudentScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RouteName.referrerScreen,
      page: ()=> ReferrerScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
      name: RouteName.studentEditProfileScreen,
      page: ()=> StudentEditProfileScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
      name: RouteName.studentPersonalDetailsScreen,
      page: ()=> StudentPersonalDetailsScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),

    GetPage(
      name: RouteName.stPostTuitionScreen,
      page: ()=> StPostTuitionScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RouteName.studentProfileScreen,
      page: ()=> StudentProfileScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),
    GetPage(
      name: RouteName.stmyActivityScreen,
      page: ()=> StMyActivityScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 250),
    ),




  ];
}