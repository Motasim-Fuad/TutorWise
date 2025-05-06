import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/routes/route_name.dart';
import '../../../screen_models/Controller/user_preference.dart';

class ReferrerProfile extends StatelessWidget {
   ReferrerProfile({super.key});
  UserPreferences userPreferences=UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("ReferrerProfile page"),
          IconButton(onPressed: (){
            userPreferences.removeUser().then((value){
              Get.toNamed(RouteName.loginScreen);
            }).onError((error,stackTrace){

            });
          }, icon: Icon(Icons.login_outlined))


        ],
      ),
    );
  }
}
