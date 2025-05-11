import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen/Student/st_my_activity/tution_post.dart';
import 'package:tutorapp/screen/Student/st_my_activity/tution_apply_screen.dart';
import '../../../../utils/Neumorphic/button.dart';

class StMyActivityScreen extends StatefulWidget {
  const StMyActivityScreen({super.key});

  @override
  State<StMyActivityScreen> createState() => _StMyActivityScreenState();
}

class _StMyActivityScreenState extends State<StMyActivityScreen> {
  // 0 = Apply, 1 = Post
  final selectedScreenIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 40,left: 20,right: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyNeumorphicButton(
                  label: 'Apply',
                  onPressed: () {
                    selectedScreenIndex.value = 0;
                  },
                ),
                MyNeumorphicButton(
                  label: 'Post',
                  onPressed: () {
                    selectedScreenIndex.value = 1;
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Obx(() {
                return selectedScreenIndex.value == 0
                    ? const TutionApplyScreen()
                    : const TutionPostScreen();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
