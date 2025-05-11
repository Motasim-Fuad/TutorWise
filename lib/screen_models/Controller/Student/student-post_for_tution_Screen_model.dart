import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorapp/repository/Student_DashBoard/st_post_for_tution_repository.dart';
import 'package:intl/intl.dart';
import '../../../models/Student/student_personal_details_profile_model.dart';

class StudentPostForTutionScreenModel extends GetxController{
  final _repo =St_postForTutionRepository();

  var divisions = <StudentLocationModel>[].obs;
  var districts = <StudentLocationModel>[].obs;
  var upazilas = <StudentLocationModel>[].obs;

  var selectedDivision = Rxn<StudentLocationModel>();
  var selectedDistrict = Rxn<StudentLocationModel>();
  var selectedUpazila = Rxn<StudentLocationModel>();




  // Form Fields
  final phoneNumber = ''.obs;
  final address = ''.obs;
  final jobTitle = ''.obs;
  final startDate = ''.obs;
  final educationLevel = ''.obs;
  final curriculum = ''.obs;
  final subjects = ''.obs;
  final lessonType = ''.obs;
  final studentGender = ''.obs;
  final tutorGender = ''.obs;
  final budget = ''.obs;
  final daysPerWeek = ''.obs;
  final tutorCurriculum = ''.obs;
  final tutorInstitute = ''.obs;
  final referrerId = ''.obs;



  final selectedEducationLevel = ''.obs;
  final selectedCurriculum = ''.obs;
  final selectedDaysPerWeek = ''.obs;
  final selectedTutorCurriculum = ''.obs;



  //Methods to update values (optional)
  void updateStartDate(DateTime date) {
    startDate.value = DateFormat('yyyy-MM-dd').format(date);
  }


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


  // Submission Method
  Future<void> passTituonPost() async {
    try {
      isLoading.value = true;

      if (selectedDivision.value == null || selectedDistrict.value == null || selectedUpazila.value == null) {
        Get.snackbar("Validation Error", "Please select Division, District, and Upazila");
        return;
      }


      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');


      print("token is :$token");

      if (token == null) {
        Get.snackbar("Error", "Authentication info not found");
        return;
      }



      Map<String, dynamic> data = {

        "phone_number": phoneNumber.value,
        "division_id": selectedDivision.value?.id.toString(),
        "district_id": selectedDistrict.value?.id,
        "upazila_id": selectedUpazila.value?.id,
        "additional_comment": address.value,
        "job_title": jobTitle.value,
        "tuition_start_date": startDate.value,
        "educational_level_choices": educationLevel.value,
        "curriculum": curriculum.value,
        "subject": subjects.value,
        "lesson_type": lessonType.value,
        "gender": studentGender.value,
        "tutor_gender": tutorGender.value,
        "budget_amount": budget.value,
        "days_per_week": daysPerWeek.value,
        "tutor_curriculum": tutorCurriculum.value,
        "tutor_institution": tutorInstitute.value,
        //"referrer_id": referrerId.value,
      };



      try{
        final response = await _repo.postForTutionApi(data);
        print("Tuition post response: $response");
        print("Response body: ${response['data']}");

        if (response['statusCode'] == 200 || response['statusCode'] == 201) {


          Get.snackbar("Success", "Tuition posted!");
        } else {
          Get.snackbar("Error", "Failed to post tuition: ${response['data']}");
        }

      }catch(e){
        print("post error is=$e");
      }



    } catch (e) {
      Get.snackbar("Failed", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }




}