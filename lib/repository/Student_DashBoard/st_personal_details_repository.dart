import 'dart:io';

import '../../data/network/network_api_services.dart';
import '../../models/Student/student_personal_details_profile_model.dart';
import '../../models/user_model.dart';
import '../../resources/app_url/app_url.dart';
import '../../screen_models/Controller/user_preference.dart';

class StPersonalDetailsRepository {
  final _apiServices = NetworkApiServices();


  Future<dynamic> addstudentPersonalDetailsApi({
    required Map<String, String> data,
    File? nidImage,
    File? profileImage,
  }) async {
    Map<String, File> files = {};
    if (nidImage != null) {
      files['nidcard_picture'] = nidImage;
    }
    if (profileImage != null) {
      files['profile_picture'] = profileImage;
    }

    return await _apiServices.postApimulti(
      url: AppUrl.add_st_personal_detailsApi,
      fields: data,
      files: files.isNotEmpty ? files : null,
    );
  }


  Future<dynamic> updateStudentDetailsMultipart({
    required Map<String, String> data,
    File? nidImage,
    File? profileImage,
  }) async {
    return await _apiServices.putMultipartApi(
      url: AppUrl.update_st_personal_detailsApi,
      fields: data,
      nidImage: nidImage,
      profileImage: profileImage,
    );
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

    if (response is Map && response.containsKey('data')) {
      final List<dynamic> data = response['data'];
      return data.map((e) => StudentLocationModel.fromJson(e)).toList();
    }

    throw Exception("Unexpected district response format: $response");
  }



  Future<List<StudentLocationModel>> fetchUpazilaListByDistrict(int districtId) async {
    final response = await _apiServices.getApi("${AppUrl.upazilaListApi}$districtId/");

    if (response is Map && response.containsKey('data')) {
      final List<dynamic> data = response['data'];
      return data.map((e) => StudentLocationModel.fromJson(e)).toList();
    }

    throw Exception("Unexpected upazila response format: $response");
  }



}
