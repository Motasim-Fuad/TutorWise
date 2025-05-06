import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import 'package:tutorapp/screen/Student/student_profile/student_edit_profile_Screen/widget/st_profile_progressbar.dart';

class StudentEditProfileScreen extends StatelessWidget {
  const StudentEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Student Profile Editing"),
            StudentProfileProgressWidget(),
           SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                  Get.toNamed(RouteName.studentPersonalDetailsScreen);
              },
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.person),
                  Column(
                    children: [
                      Text("Personal Details",style: Theme.of(context).textTheme.titleLarge),
                      Text("Your personal Information",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
