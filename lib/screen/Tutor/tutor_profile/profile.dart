import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import 'package:tutorapp/screen_models/Controller/user_preference.dart';

class TutorProfileScreen extends StatelessWidget {
   TutorProfileScreen({super.key});
UserPreferences userPreferences=UserPreferences();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:Column(
          children: [
            Text("Tutor Profile Page "),
            // log out
            IconButton(onPressed: (){
              userPreferences.removeUser().then((value){
                Get.toNamed(RouteName.loginScreen);
              }).onError((error,stackTrace){

              });
            }, icon: Icon(Icons.login_outlined))

          ],
        ),
      ),
    );
  }
}
