import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/colors/app_color.dart';
import 'package:tutorapp/screen/referrer/referrer_my_refer/referrer_my_refer.dart';
import 'package:tutorapp/screen/referrer/referrer_profile/referrer_profile.dart';
import 'package:tutorapp/screen/referrer/reffer_home/refferer_home.dart';
import 'package:tutorapp/screen/referrer/reffer_my_activity/referer_my_activity.dart';

import '../Tutor/widget/top_bar.dart';
import '../referrer/widget/coustom_dowar.dart';
import '../../screen_models/Controller/main_controller.dart';



class ReferrerScreen extends StatelessWidget {
  final pages = [
    ReffererHome(),
    RefererMyActivity(),
    ReferrerMyRefer(),
    ReferrerProfile()
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainController>();

    return Obx(() => Scaffold(
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
        backgroundColor: AppColor.primary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: 'my activity'),
          BottomNavigationBarItem(icon: Icon(Icons.room_preferences), label: 'my refer'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    ));
  }
}
