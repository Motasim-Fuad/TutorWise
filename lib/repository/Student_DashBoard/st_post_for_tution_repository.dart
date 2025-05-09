import 'package:tutorapp/data/network/network_api_services.dart';

import '../../models/Student/student_personal_details_profile_model.dart';
import '../../resources/app_url/app_url.dart';

class St_postForTutionRepository{
  final _apiServices=NetworkApiServices();

  Future<dynamic> postForTutionApi(var data)async{
    dynamic response = await _apiServices.postApi( data,AppUrl.stPostForTution);
    return response;
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