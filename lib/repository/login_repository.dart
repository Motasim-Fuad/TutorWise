import 'package:tutorapp/data/network/network_api_services.dart';


import '../resources/app_url/app_url.dart';

class LoginRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      return await _apiServices.postApi(data, AppUrl.loginApi, requiresAuth: false);
    } catch (e) {
      rethrow;
    }
  }
}
