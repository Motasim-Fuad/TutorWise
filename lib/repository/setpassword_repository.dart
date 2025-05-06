// lib/repository/reset_password_repository.dart
import 'package:tutorapp/data/network/network_api_services.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';

class SetPasswordRepository {
  final _api = NetworkApiServices();

  Future<dynamic> setPasswordApi(Map<String, dynamic> data) async {
    return await _api.postApi(data, AppUrl.setPassword);
  }
}
