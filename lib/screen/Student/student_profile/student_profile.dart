import 'package:flutter/material.dart';
import '../../../screen_models/Controller/user_preference.dart';

class StudentProfile extends StatelessWidget {
   StudentProfile({super.key});
  UserPreferences userPreferences=UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("student profile"),

          ],
        ),
      ),
    );
  }
}
