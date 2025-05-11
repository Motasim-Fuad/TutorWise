import 'package:flutter/material.dart';

import '../../../utils/Neumorphic/button.dart';

class StudentOffers extends StatelessWidget {
  const StudentOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyNeumorphicButton(
            label: 'neumorphic',
            onPressed: () {
              print('Neumorphic button pressed!');
            },
          ),
          Center(
            child: Text("StudentOffers Page"),
          ),
        ],
      ),
    );
  }
}
