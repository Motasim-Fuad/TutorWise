

import 'package:flutter/foundation.dart';

import '../../data/network/network_api_services.dart';
import '../../models/Student/st_show_tution_post_list_model.dart';
import '../../resources/app_url/app_url.dart'; // Contains API endpoints

class TutionPostRepository {
  final _apiService = NetworkApiServices();

  Future<TutionPostResponse> fetchTutionPosts() async {
    try {
      final response = await _apiService.getApi(AppUrl.stTutionPostList);
      if (kDebugMode) {
        print("Raw API response for post: $response");
      }
      return TutionPostResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
