import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/screen/Student/student_profile/student_edit_profile_Screen/widget/st_profile_progressbar.dart';
import 'package:tutorapp/screen_models/Controller/Student/StudentProfileScreenModel.dart';
import '../../../resources/app_url/app_url.dart';

class StudentProfileScreen extends StatelessWidget {
  final controller = Get.put(StudentProfileScreenModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final data = controller.profile.value;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              // Profile Picture
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.deepPurple.shade100,
                  backgroundImage: data.profilePicture != null
                      ? NetworkImage("${AppUrl.baseurl}${data.profilePicture}")
                      : null,
                  child: data.profilePicture == null
                      ? Icon(Icons.person, size: 50, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(height: 20),

              // Profile Details Card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      buildTile("Full Name", data.fullName),
                      buildTile("Phone", data.studentPhone),
                      buildTile("Address", data.address),
                      buildTile("Division", data.division),
                      buildTile("District", data.district),
                      buildTile("Upazila", data.upazila),
                      buildTile("Gender", data.gender),
                      buildTile("NID Number", data.nidcardNumber),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // NID Image
              Align(
                alignment: Alignment.centerLeft,
                child: Text("NID Image:", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 8),
              if (data.nidcardPicture != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "${AppUrl.baseurl}${data.nidcardPicture}",
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Text("Failed to load image"),
                  ),
                )
              else
                Text("No image uploaded"),
            ],
          ),
        );
      }),
    );
  }

  Widget buildTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "$title:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value ?? 'N/A',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
