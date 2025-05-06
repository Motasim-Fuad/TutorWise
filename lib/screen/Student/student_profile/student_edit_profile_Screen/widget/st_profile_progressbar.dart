import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen_models/Controller/Student/Student_profile_screen_model.dart';


class StudentProfileProgressWidget extends StatelessWidget {
  final StudentProfileScreenModel viewModel = Get.put(StudentProfileScreenModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (viewModel.isLoading.value) {
        return const Padding(
          padding: EdgeInsets.all(20),
          child: LinearProgressIndicator(),
        );
      }

      return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              'Profile ${viewModel.completion.value}% complete',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: viewModel.completion.value / 100,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      );
    });
  }
}
