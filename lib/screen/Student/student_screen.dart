import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/colors/app_color.dart';
import 'package:tutorapp/screen/Student/student_home/student_home.dart';
import 'package:tutorapp/screen/Student/student_my_offers/student_offers.dart';
import 'package:tutorapp/screen/Student/student_my_tutor/student_my_tutor.dart';
import 'package:tutorapp/screen/Student/student_profile/student_profile.dart';
import '../../screen_models/Controller/main_controller.dart';
import '../../screen_models/services/theme_screen_model.dart';
import '../Student/widget/coustom_dowar.dart';
import '../Student/widget/top_bar.dart';

class StudentScreen extends StatelessWidget {
  final pages = [
    StudentHomeScreen(),
    StudentMyTutor(),
    StudentOffers(),
    StudentProfileScreen()
  ];

  @override
  @override
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();
    final themeController = Get.find<ThemeScreenModel>();

    return Obx(() {
      final brightness = MediaQuery.of(context).platformBrightness;
      final isDark = themeController.themeMode.value == ThemeMode.system
          ? brightness == Brightness.dark
          : themeController.themeMode.value == ThemeMode.dark;

      // Set fullscreen mode
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

      final systemOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      );

      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemOverlayStyle,
        child: Scaffold(
          extendBodyBehindAppBar: true, // Optional for transparent top effect
          drawer: CustomDrawer(),
          body: Column(
            children: [
              TopBar(title: controller.title),
              Expanded(child: pages[controller.currentIndex.value]),
            ],
          ),

          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColor.butom_nav_bgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                onTap: controller.changePage,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[400],
                backgroundColor: AppColor.butom_nav_bgColor,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: true,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                unselectedLabelStyle: TextStyle(fontSize: 12),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school_outlined),
                    activeIcon: Icon(Icons.school),
                    label: 'My Tutor',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_offer_outlined),
                    activeIcon: Icon(Icons.local_offer),
                    label: 'Offers',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline),
                    activeIcon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}






