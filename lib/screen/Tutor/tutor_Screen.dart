import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen/Tutor/tution_job/tution_job.dart';
import 'package:tutorapp/screen/Tutor/tutor_home/home_screen.dart';
import 'package:tutorapp/screen/Tutor/tutor_my_activity/my_activity.dart';
import 'package:tutorapp/screen/Tutor/tutor_profile/profile.dart';
import 'package:tutorapp/screen/Tutor/widget/coustom_dowar.dart';
import 'package:tutorapp/screen/Tutor/widget/top_bar.dart';

import '../../screen_models/Controller/main_controller.dart';

class TutorScreen extends StatelessWidget {
  TutorScreen({super.key});

  final pages = [
    TutorHomeScreen(),
    TutorJobScreen(),
    TutorMyActivityScreen(),
    TutorProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Obx(
          () => Scaffold(
        drawer: const CustomDrawer(),
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
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.work_history_outlined), label: 'Tuition Jobs'),
            BottomNavigationBarItem(icon: Icon(Icons.library_books_sharp), label: 'My Activity'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
