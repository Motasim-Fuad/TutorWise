import '../../data/network/network_api_services.dart';
import '../../models/Student/student_personal_details_profile_model.dart';
import '../../models/user_model.dart';
import '../../resources/app_url/app_url.dart';
import '../../screen_models/Controller/user_preference.dart';

class StPersonalDetailsRepository {
  final _apiServices = NetworkApiServices();
  final _userPrefs = UserPreferences();

  Future<int?> getStudentId() async {
    UserModel user = await _userPrefs.getUser();
    return user.studentId;
  }



  Future<dynamic> studentPersonalDetailsApi(Map<String, dynamic> data) async {
    // final studentId = await getStudentId();
    //
    // if (studentId != null) {
    //   data['student_id'] = studentId;
    // }

    return await _apiServices.postApi(data, AppUrl.add_st_personal_detailsApi);

  }

  Future<dynamic> updateStudentDetails(Map<String, dynamic> data) async {
    final studentId = await getStudentId();

    if (studentId == null) {
      throw Exception("Student ID not found. Cannot update personal details.");
    }

    final url = "${AppUrl.update_st_personal_detailsApi}$studentId/";
    return await _apiServices.putApi(data, url);
  }






  Future<List<StudentLocationModel>> fetchDivisionList() async {
    final response = await _apiServices.getApi(AppUrl.divisionListApi);

    // Handle raw list response
    if (response is List) {
      return response.map((e) => StudentLocationModel.fromJson(e)).toList();
    }

    // Handle map with 'data' key
    if (response is Map && response.containsKey('data')) {
      return (response['data'] as List)
          .map((e) => StudentLocationModel.fromJson(e))
          .toList();
    }

    throw Exception("Unexpected division response format: $response");
  }


  Future<List<StudentLocationModel>> fetchDistrictListByDivision(int divisionId) async {
    final response = await _apiServices.getApi("${AppUrl.districtListApi}$divisionId/");
    return (response as List)
        .map((e) => StudentLocationModel.fromJson(e))
        .toList();
  }

  Future<List<StudentLocationModel>> fetchUpazilaListByDistrict(int districtId) async {
    final response = await _apiServices.getApi("${AppUrl.upazilaListApi}$districtId/");
    return (response as List)
        .map((e) => StudentLocationModel.fromJson(e))
        .toList();
  }
}
