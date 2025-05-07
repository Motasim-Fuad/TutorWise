import 'package:flutter/foundation.dart';
import 'package:tutorapp/data/network/network_api_services.dart';
import 'package:tutorapp/models/Student/student_profile_progress_Model.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';

class StProfileProgressbarRepository {
  final _apiServices = NetworkApiServices();

  Future<StudentProfileModel> fetchProfileProgress() async {
    final response = await _apiServices.getApi(AppUrl.st_profile_progressbarApi);
    if (kDebugMode) {
      print("Raw API Response: $response");
    }

    return StudentProfileModel.fromJson(response['data']);
  }
}
