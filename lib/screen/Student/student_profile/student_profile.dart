import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: "${AppUrl.baseurl}${data.profilePicture}"!= null
                      ? NetworkImage("${AppUrl.baseurl}${data.profilePicture}")
                      : null,
                  child: "${AppUrl.baseurl}${data.profilePicture}" == null
                      ? Icon(Icons.person, size: 40)
                      : null,
                ),
              ),
              SizedBox(height: 20),
              buildTile("Full Name", data.fullName),
              buildTile("Phone", data.studentPhone),
             // buildTile("Customized User ID", data.customizedUserId),
              buildTile("Address", data.address),
            //  buildTile("Location", data.location),
              buildTile("Division", data.division),
              buildTile("District", data.district),
              buildTile("Upazila", data.upazila),
             // buildTile("Division ID", data.divisionId),
             // buildTile("District ID", data.districtId),
              // buildTile("Upazila ID", data.upazilaId),
              buildTile("Gender", data.gender),
              buildTile("NID Number", data.nidcardNumber),
              SizedBox(height: 10),
              Text("NID Image:"),
              if (data.nidcardPicture != null)
                Image.network(
                  "${AppUrl.baseurl}${data.nidcardPicture}",
                  height: 150,
                  errorBuilder: (context, error, stackTrace) => Text("Failed to load image"),
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
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value ?? 'N/A')),
        ],
      ),
    );
  }
}
