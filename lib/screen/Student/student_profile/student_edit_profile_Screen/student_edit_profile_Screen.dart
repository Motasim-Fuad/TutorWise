import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import 'package:tutorapp/screen/Student/student_profile/student_edit_profile_Screen/widget/st_profile_progressbar.dart';
import 'package:tutorapp/screen_models/Controller/Student/Student_profile_screen_model.dart';

class StudentEditProfileScreen extends StatefulWidget {
  const StudentEditProfileScreen({super.key});

  @override
  State<StudentEditProfileScreen> createState() => _StudentEditProfileScreenState();
}

class _StudentEditProfileScreenState extends State<StudentEditProfileScreen> {
  final controller = Get.put(StudentProfileScreenModel());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Student Profile Editing"),
            StudentProfileProgressWidget(),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.studentPersonalDetailsScreen);
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(width: 3,strokeAlign: 1,color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.person),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal Details",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          "Your personal Information",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
