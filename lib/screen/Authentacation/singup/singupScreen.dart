import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/assets/image_assets.dart';
import 'package:tutorapp/screen/Authentacation/singup/singup_form/referrer_singup_form.dart';
import 'package:tutorapp/screen/Authentacation/singup/singup_form/student_singup_form.dart';
import 'package:tutorapp/screen/Authentacation/singup/singup_form/tutor_singup_form.dart';
import '../../../screen_models/Controller/singup/singup_screen_model.dart';
import '../../../screen_models/Controller/singup/singup_selection_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final signUpSelectionController = Get.put(SignUpSelectionController());
  final signUpFormController = Get.put(SignUpScreenModel());

  final List<String> roles = ["Tutor", "Student", "Referrer"];
  final List<String> rolesImage = ["assets/images/teacher.png", "assets/images/student.png", "assets/images/referrer.png"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(ImageAssets.logo,),height: 200,),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    return GestureDetector(
                      onTap: () => signUpSelectionController.selectRole(index),
                      child: Container(
                        height: 101,
                        width: 90,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: signUpSelectionController.selectedIndex.value == index
                                ? Colors.red
                                : Colors.grey,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image(image: AssetImage(rolesImage[index]),height: 50,width: 50,),

                            const SizedBox(height: 4),
                            Text(roles[index]),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
        
                /// Ternary logic to switch forms
                signUpSelectionController.selectedIndex.value == 0
                    ? TutorSingupForm()
                    : signUpSelectionController.selectedIndex.value == 1
                    ? StudentSingupForm()
                    : ReferrerSingupForm(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
