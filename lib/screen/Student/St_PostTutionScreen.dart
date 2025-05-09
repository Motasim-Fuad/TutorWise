import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorapp/resources/components/round_button.dart';

import '../../../models/Student/student_personal_details_profile_model.dart';
import '../../screen_models/Controller/Student/student-post_for_tution_Screen_model.dart';

class StPostTuitionScreen extends StatelessWidget {
  final controller = Get.put(StudentPostForTutionScreenModel());

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController tutorInstituteController = TextEditingController();
  final TextEditingController referrerIdController = TextEditingController();
  final TextEditingController subjectsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post your Tuition")),
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _textField("Phone Number", phoneController),
              _datePickerField(controller),
              _divisionDropdown(),
              SizedBox(height: 10,),
              _districtDropdown(),
              SizedBox(height: 10,),
              _upazilaDropdown(),
              SizedBox(height: 10,),
              _textField("Address", addressController),
              _dropdownField("Education Level", ["Class 1", "Class 2", "Class 3"]),
              _dropdownField("Curriculums", ["N/A", "Bangla Medium", "English Medium"]),
              _textField("Job Title", jobTitleController),
              _textField("Subjects", subjectsController),
              _radioGroup("Lesson Type", ["Online", "Offline", "Both"], controller.lessonType),
              _radioGroup("Student Gender", ["Male", "Female"], controller.studentGender),
              _radioGroup("Tutor Gender", ["Male", "Female", "Any"], controller.tutorGender),
              _textField("Budget", budgetController, inputType: TextInputType.number),
              _dropdownField("Days Per Week", ["1", "2", "3", "4", "5", "6", "7"]),
              _dropdownField("Tutor Curriculum", ["Bangla Medium", "English Medium"]),
              _textField("Tutor Institute", tutorInstituteController),
              _textField("Referrer ID", referrerIdController),
              SizedBox(height: 20),
             RoundButton(
                 title: "post",
                 width: double.infinity,
                 onPress: (){
               controller.phoneNumber.value = phoneController.text;
               controller.address.value = addressController.text;
               controller.jobTitle.value = jobTitleController.text;
               controller.budget.value = budgetController.text;
               controller.tutorInstitute.value = tutorInstituteController.text;
               controller.referrerId.value = referrerIdController.text;
               controller.subjects.value = subjectsController.text;
               controller.passTituonPost();
             })
            ],
          ),
        );
      }),
    );
  }

  Widget _textField(String label, TextEditingController controller, {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }

  Widget _datePickerField(StudentPostForTutionScreenModel controller) {
    return Obx(() => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        readOnly: true,
        controller: TextEditingController(text: controller.startDate.value),
        decoration: InputDecoration(
          labelText: "Start Date",
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.calendar_today),
        ),
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime(2100),
          );
          if (picked != null) controller.updateStartDate(picked);
        },
      ),
    ));
  }


  Widget _divisionDropdown() {
    return Obx(() => DropdownButtonFormField<StudentLocationModel>(
      decoration: InputDecoration(labelText: "Division", border: OutlineInputBorder()),
      value: controller.selectedDivision.value,
      items: controller.divisions
          .map((div) => DropdownMenuItem(value: div, child: Text(div.name)))
          .toList(),
      onChanged: (val) {
        if (val != null) controller.onDivisionChanged(val);
      },
    ));
  }

  Widget _districtDropdown() {
    return Obx(() => DropdownButtonFormField<StudentLocationModel>(
      decoration: InputDecoration(labelText: "District", border: OutlineInputBorder()),
      value: controller.selectedDistrict.value,
      items: controller.districts
          .map((district) => DropdownMenuItem(value: district, child: Text(district.name)))
          .toList(),
      onChanged: (val) {
        if (val != null) controller.onDistrictChanged(val);
      },
    ));
  }

  Widget _upazilaDropdown() {
    return Obx(() => DropdownButtonFormField<StudentLocationModel>(
      decoration: InputDecoration(labelText: "Upazila", border: OutlineInputBorder()),
      value: controller.selectedUpazila.value,
      items: controller.upazilas
          .map((upazila) => DropdownMenuItem(value: upazila, child: Text(upazila.name)))
          .toList(),
      onChanged: (val) {
        controller.selectedUpazila.value = val;
      },
    ));
  }

  Widget _dropdownField(String label, List<String> items) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: (val) {},
      ),
    );
  }

  Widget _radioGroup(String label, List<String> options, RxString selectedValue) {
    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 10,
            children: options.map((opt) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<String>(
                    value: opt,
                    groupValue: selectedValue.value,
                    onChanged: (value) {
                      if (value != null) selectedValue.value = value;
                    },
                  ),
                  Text(opt),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    ));
  }

}
