import 'package:flutter/material.dart';
import 'package:tutorapp/screen/Student/student_my_offers/widget/offer_card.dart';

import '../../../utils/Neumorphic/button.dart';

class StudentOffers extends StatelessWidget {
  const StudentOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("My tution Offer"),
          Expanded(child: ListView.builder(
            itemCount: 12,
              itemBuilder: (context,index){
            return StOffersCard();
          })
          )


        ],
      ),
    );
  }
}
