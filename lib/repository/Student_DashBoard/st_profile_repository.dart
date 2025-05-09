import 'package:flutter/foundation.dart';
import 'package:tutorapp/data/network/network_api_services.dart';
import 'package:tutorapp/models/Student/student_profile_model.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';

class StProfileRepository {
  final _apiServices = NetworkApiServices();

  Future<StudentProfileModel> fetchProfileDetails() async {
    final response = await _apiServices.getApi(AppUrl.showStudentPersonalDetailsApi);
    if (kDebugMode) {
      print("Raw API Response: $response");
    }

    return StudentProfileModel.fromJson(response['data']);
  }
}
