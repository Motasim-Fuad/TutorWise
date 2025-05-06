import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/Student/student_personal_details_profile_model.dart';
import '../../../repository/Student_DashBoard/st_personal_details_repository.dart';
import '../user_preference.dart';

class StudentPersonalDetailsScreenModel extends GetxController {
  final _repo = StPersonalDetailsRepository();

  var divisions = <StudentLocationModel>[].obs;
  var districts = <StudentLocationModel>[].obs;
  var upazilas = <StudentLocationModel>[].obs;

  var selectedDivision = Rxn<StudentLocationModel>();
  var selectedDistrict = Rxn<StudentLocationModel>();
  var selectedUpazila = Rxn<StudentLocationModel>();

  var gender = 'Male'.obs;
  var nidImage = Rxn<File>();
  var profileImage = Rxn<File>();

  String? nidImageBase64;
  String? profileImageBase64;

  @override
  void onInit() {
    super.onInit();
    fetchDivisions();
  }

  var isLoading = false.obs;

  Future<void> fetchDivisions() async {
    try {
      isLoading.value = true;
      divisions.value = await _repo.fetchDivisionList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch divisions");
    } finally {
      isLoading.value = false;
    }
  }


  void onDivisionChanged(StudentLocationModel division) async {
    selectedDivision.value = division;
    selectedDistrict.value = null;
    selectedUpazila.value = null;
    districts.value = await _repo.fetchDistrictListByDivision(division.id);
    upazilas.clear();
  }

  void onDistrictChanged(StudentLocationModel district) async {
    selectedDistrict.value = district;
    selectedUpazila.value = null;
    upazilas.value = await _repo.fetchUpazilaListByDistrict(district.id);
  }

  Future<void> pickNidImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      nidImage.value = file;
      final bytes = await file.readAsBytes();
      nidImageBase64 = base64Encode(bytes);
    }
  }

  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      profileImage.value = file;
      final bytes = await file.readAsBytes();
      profileImageBase64 = base64Encode(bytes);
    }
  }

  void submitDetails(Map<String, dynamic> formData) {
    formData['gender'] = gender.value;
    formData['nidcard_picture'] = nidImageBase64;
    formData['profile_picture'] = profileImageBase64;
    _repo.studentPersonalDetailsApi(formData);
  }

  Future<void> updateDetails(String StudentId, Map<String, dynamic> formData) async {

    formData['gender'] = gender.value;
    formData['nidcard_picture'] = nidImageBase64;
    formData['profile_image'] = profileImageBase64;
    _repo.updateStudentDetails(formData );
  }


}
