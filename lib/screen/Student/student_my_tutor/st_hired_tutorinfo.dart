import 'package:flutter/material.dart';
import 'package:tutorapp/screen/Student/student_my_tutor/widget/my_tutor_card.dart';

class StHiredTutorinfo extends StatefulWidget {
  const StHiredTutorinfo({super.key});

  @override
  State<StHiredTutorinfo> createState() => _StHiredTutorinfoState();
}

class _StHiredTutorinfoState extends State<StHiredTutorinfo> {
  @override
  Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: 3,
      itemBuilder: (context,index){
    return StmyTutorCard();
  });
  }
}
