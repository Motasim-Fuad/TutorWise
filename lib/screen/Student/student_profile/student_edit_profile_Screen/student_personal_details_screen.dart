import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/utils/utils.dart';
import '../../../../screen_models/Controller/Student/student_personal_details_screen_model.dart';
import '../../../../models/Student/student_personal_details_profile_model.dart';
import '../../../../screen_models/Controller/user_preference.dart';

class StudentPersonalDetailsScreen extends StatelessWidget {
  final controller = Get.put(StudentPersonalDetailsScreenModel());

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final nidController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Personal Details")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Obx(() => GestureDetector(
            onTap: controller.pickProfileImage,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: controller.profileImage.value != null
                  ? FileImage(controller.profileImage.value!)
                  : null,
              child: controller.profileImage.value == null
                  ? Icon(Icons.camera_alt, size: 40)
                  : null,
            ),
          )),
          SizedBox(height: 20),
          TextField(controller: nameController, decoration: InputDecoration(labelText: 'Full Name')),
          TextField(controller: phoneController, decoration: InputDecoration(labelText: 'Phone')),
          Obx(() => DropdownButtonFormField<StudentLocationModel>(
            decoration: InputDecoration(labelText: 'Division'),
            value: controller.selectedDivision.value,
            items: controller.divisions.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
            onChanged: (value) => controller.onDivisionChanged(value!),
          )),
          Obx(() => DropdownButtonFormField<StudentLocationModel>(
            decoration: InputDecoration(labelText: 'District'),
            value: controller.selectedDistrict.value,
            items: controller.districts.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
            onChanged: (value) => controller.onDistrictChanged(value!),
          )),
          Obx(() => DropdownButtonFormField<StudentLocationModel>(
            decoration: InputDecoration(labelText: 'Upazila'),
            value: controller.selectedUpazila.value,
            items: controller.upazilas.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
            onChanged: (value) => controller.selectedUpazila.value = value,
          )),
          TextField(controller: addressController, decoration: InputDecoration(labelText: 'Address')),
          TextField(controller: nidController, decoration: InputDecoration(labelText: 'NID Number')),
          Obx(() => controller.nidImage.value == null
              ? OutlinedButton(onPressed: controller.pickNidImage, child: Text('Choose NID Picture'))
              : Column(children: [
            Image.file(controller.nidImage.value!, height: 100),
            TextButton(onPressed: controller.pickNidImage, child: Text('Change NID Picture')),
          ])),
          SizedBox(height: 10),
          Obx(() => Row(children: [
            Radio(value: 'Male', groupValue: controller.gender.value, onChanged: (v) => controller.gender.value = v!),
            Text("Male"),
            Radio(value: 'Female', groupValue: controller.gender.value, onChanged: (v) => controller.gender.value = v!),
            Text("Female"),
            Radio(value: 'Other', groupValue: controller.gender.value, onChanged: (v) => controller.gender.value = v!),
            Text("Other"),
          ])),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
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

              if (kDebugMode) {
                print("submmit succes");
              }
              Utils.snackBar("Submit", "Data Submit  Success");
            },
            child: Text("Submit"),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () async {
              final user = await UserPreferences().getUser();
              final studentId = user.studentId;

              final data = {
                'full_name': nameController.text,
                'phone': phoneController.text,
                'division_id': controller.selectedDivision.value?.id,
                'district_id': controller.selectedDistrict.value?.id,
                'upazila_id': controller.selectedUpazila.value?.id,
                'address': addressController.text,
                'nid_number': nidController.text,
              };
              if (studentId == null) {
                Utils.snackBar("Error", "Student ID not found");
                return;
              }

              controller.updateDetails(studentId.toString(), data);

              if (kDebugMode) {
                print("Update SuccessFull");
              }
            },
            child: Text("Update"),
          )

        ]),
      ),
    );
  }
}
