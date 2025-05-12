import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../screen_models/Controller/Student/Student_profile_progresbar_screen_model.dart';


class StudentProfileProgressWidget extends StatefulWidget {
  @override
  State<StudentProfileProgressWidget> createState() => _StudentProfileProgressWidgetState();
}

class _StudentProfileProgressWidgetState extends State<StudentProfileProgressWidget> {
  final StudentProfileProgressBarScreenModel controller = Get.put(StudentProfileProgressBarScreenModel());

  @override
  void initState() {
    super.initState();
    final shouldRefresh = Get.arguments == true;
    if (shouldRefresh) {
      controller.fetchProfileProgress();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: Center(child: CircularProgressIndicator()),
        );
      }



      return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey,width: 1,strokeAlign: 1)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile ${controller.completion.value}% complete',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              minHeight: 10.0,
              value: controller.completion.value / 100.0,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(
                getProgressColor(controller.completion.value),
              ),
            ),
          ],
        ),
      );
    });
  }

  Color getProgressColor(int value) {
    if (value >= 80) return Colors.green;
    if (value >= 50) return Colors.orange;
    if(value ==0)return Colors.white;
    return Colors.red;
  }
}
