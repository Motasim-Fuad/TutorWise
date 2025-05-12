import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';
import 'package:tutorapp/resources/components/round_button.dart';
import '../../../screen_models/Controller/Student/st_show_hire_tutorScreenModel.dart';
import '../../../utils/Neumorphic/button.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final _showHireTutorController = Get.put(StShowHireTutorscreenmodel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Hire Your Tutor",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Obx(() {
              if (_showHireTutorController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (_showHireTutorController.error.isNotEmpty) {
                return Center(child: Text(_showHireTutorController.error.value));
              } else if (_showHireTutorController.tutorList.isEmpty) {
                return const Center(child: Text("No tutors found."));
              } else {
                return ListView.builder(
                  itemCount: _showHireTutorController.tutorList.length,
                  itemBuilder: (context, index) {
                    final data = _showHireTutorController.tutorList[index];
                    return TutorCard(
                      image: data.profilePicture,
                      name: data.fullName ?? "Unknown",
                      university: data.universityName ?? "Not provided",
                      subject: data.subject ?? "N/A",
                      location: data.location ?? "Location unavailable",
                      studentLevel: data.tutorIWillTeach ?? "N/A",
                      schedule: data.daysPerWeek ?? "N/A",
                      fee: data.chargePerMonth ?? "N/A",
                    );

                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

class TutorCard extends StatelessWidget {
  final String name;
  final String image;
  final String university;
  final String subject;
  final String location;
  final String studentLevel;
  final String schedule;
  final String fee;


  const TutorCard({
    super.key,
    required this.name,
    required this.image,
    required this.university,
    required this.subject,
    required this.location,
    required this.studentLevel,
    required this.schedule,
    required this.fee,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                 CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("${AppUrl.baseurl}$image"),

                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$name ⭐️ 3",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(university,
                          style: Theme.of(context).textTheme.bodySmall),
                      Text("Specialist in $subject",
                          style: const TextStyle(
                              color: Colors.deepOrangeAccent)),
                      const SizedBox(height: 6),

                    ],
                  ),
                )
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(icon: Icons.location_on, text: location),
                IconText(icon: Icons.language, text: subject),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(icon: Icons.group, text: studentLevel),
                IconText(icon: Icons.schedule, text: schedule),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconText(icon: Icons.attach_money, text: "$fee Monthly"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: (){

                }, icon: Icon(Icons.bookmark_border)),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("View Profile "),
                ),
                NeumorphicButton(
                  onPressed: (){

                  },
                  style: NeumorphicStyle(
                    color: Colors.redAccent,

                    shape: NeumorphicShape.concave,
                    depth: -3,
                    intensity: 0.6,
                    surfaceIntensity: 0.1,
                  ),
                  child: Text("Apply"),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconText({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.deepOrange),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
