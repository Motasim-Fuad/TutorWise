import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/components/round_button.dart';
import 'package:tutorapp/resources/routes/route_name.dart';
import 'package:tutorapp/screen_models/Controller/Student/Student_profile_progresbar_screen_model.dart';
import 'package:tutorapp/utils/utils.dart';
import '../../../../screen_models/Controller/Student/student_personal_details_screen_model.dart';
import '../../../../models/Student/student_personal_details_profile_model.dart';
import '../../../../screen_models/Controller/user_preference.dart';

class addStudentpersonalScreen extends StatelessWidget {
  final controller = Get.put(StudentPersonalDetailsScreenModel());
  final progresController = Get.put(StudentProfileProgressBarScreenModel());

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final nidController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Your Details")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(
                  () => GestureDetector(
                onTap: controller.pickProfileImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:
                  controller.profileImage.value != null
                      ? FileImage(controller.profileImage.value!)
                      : null,
                  child:
                  controller.profileImage.value == null
                      ? Icon(Icons.camera_alt, size: 40)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Full Name',  border: OutlineInputBorder(),),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone',  border: OutlineInputBorder(),),
            ),
            SizedBox(height: 10),
            Obx(
                  () => DropdownButtonFormField<StudentLocationModel>(
                decoration: InputDecoration(labelText: 'Division',  border: OutlineInputBorder(),),
                value: controller.selectedDivision.value,
                items:
                controller.divisions
                    .map(
                      (e) =>
                      DropdownMenuItem(value: e, child: Text(e.name)),
                )
                    .toList(),
                onChanged: (value) => controller.onDivisionChanged(value!),
              ),
            ),
            SizedBox(height: 10),
            Obx(
                  () => DropdownButtonFormField<StudentLocationModel>(
                decoration: InputDecoration(labelText: 'District',  border: OutlineInputBorder(),),
                value: controller.selectedDistrict.value,
                items:
                controller.districts
                    .map(
                      (e) =>
                      DropdownMenuItem(value: e, child: Text(e.name)),
                )
                    .toList(),
                onChanged: (value) => controller.onDistrictChanged(value!),
              ),
            ),
            SizedBox(height: 10),
            Obx(
                  () => DropdownButtonFormField<StudentLocationModel>(
                decoration: InputDecoration(labelText: 'Upazila',  border: OutlineInputBorder(),),
                value: controller.selectedUpazila.value,
                items:
                controller.upazilas
                    .map(
                      (e) =>
                      DropdownMenuItem(value: e, child: Text(e.name)),
                )
                    .toList(),
                onChanged: (value) => controller.selectedUpazila.value = value,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address',  border: OutlineInputBorder(),),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nidController,
              decoration: InputDecoration(labelText: 'NID Number',  border: OutlineInputBorder(),),
            ),
            SizedBox(height: 10),
            Obx(
                  () =>
              controller.nidImage.value == null
                  ? OutlinedButton(
                onPressed: controller.pickNidImage,
                child: Text('Choose NID Picture',),
              )
                  : Column(
                children: [
                  Image.file(controller.nidImage.value!, height: 100),
                  TextButton(
                    onPressed: controller.pickNidImage,
                    child: Text('Change NID Picture'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Obx(
                  () => Row(
                children: [
                  Radio(
                    value: 'Male',
                    groupValue: controller.gender.value,
                    onChanged: (v) => controller.gender.value = v!,
                  ),
                  Text("Male"),
                  Radio(
                    value: 'Female',
                    groupValue: controller.gender.value,
                    onChanged: (v) => controller.gender.value = v!,
                  ),
                  Text("Female"),
                  Radio(
                    value: 'Other',
                    groupValue: controller.gender.value,
                    onChanged: (v) => controller.gender.value = v!,
                  ),
                  Text("Other"),
                ],
              ),
            ),
            SizedBox(height: 20),
            RoundButton(
              width: double.infinity,
              title: 'Submit',
              onPress: () async {
                final data = {
                  'full_name': nameController.text,
                  'phone': phoneController.text,
                  'division_id': controller.selectedDivision.value?.id,
                  'district_id': controller.selectedDistrict.value?.id,
                  'upazila_id': controller.selectedUpazila.value?.id,
                  'address': addressController.text,
                  'nidcard_number': nidController.text,
                };
                controller.submitDetails(data);

                progresController.fetchProfileProgress();
                if (kDebugMode) {
                  print("submmit succes");
                }
                Utils.snackBar("Submit", "Data Submit  Success");
                Get.offNamed(
                  RouteName.studentProfileScreen,
                  arguments: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
