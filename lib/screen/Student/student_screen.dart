import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/colors/app_color.dart';
import 'package:tutorapp/screen/Student/student_home/student_home.dart';
import 'package:tutorapp/screen/Student/student_my_offers/student_offers.dart';
import 'package:tutorapp/screen/Student/student_my_tutor/student_my_tutor.dart';
import 'package:tutorapp/screen/Student/student_profile/student_profile.dart';


import '../../screen_models/Controller/main_controller.dart';

import '../Student/widget/coustom_dowar.dart';
import '../Student/widget/top_bar.dart';

class StudentScreen extends StatelessWidget {
  final pages = [
      StudentHomeScreen(),
      StudentMyTutor(),
    StudentOffers(),
    StudentProfile()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Obx(() => Scaffold(
      drawer:  CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            TopBar(title: controller.title),
            Expanded(child: pages[controller.currentIndex.value]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColor.butom_nav_bgColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.all_inbox), label: 'my tutor'),
          BottomNavigationBarItem(icon: Icon(Icons.offline_bolt), label: 'offer'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),

        ],
      ),
    ));
  }
}
