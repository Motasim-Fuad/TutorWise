import 'package:flutter/material.dart';
import 'package:tutorapp/screen/Student/student_my_tutor/widget/my_tutor_card.dart';

class StSaveTutorinfo extends StatefulWidget {
  const StSaveTutorinfo({super.key});

  @override
  State<StSaveTutorinfo> createState() => _StSaveTutorinfoState();
}

class _StSaveTutorinfoState extends State<StSaveTutorinfo> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context,index){
          return StmyTutorCard();
        }
    );
  }
}
