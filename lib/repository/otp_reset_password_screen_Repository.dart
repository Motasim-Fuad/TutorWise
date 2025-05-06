// lib/repository/otp_repository.dart
import 'package:tutorapp/data/network/network_api_services.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';

class OtpResetPasswordScreenRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> verifyOtpApirs(Map<String, dynamic> data) async {
    return await _apiServices.postApi(data, AppUrl.otp_verifyApi);
  }

  Future<dynamic> resendOtpApirs(Map<String, dynamic> data) async {
    return await _apiServices.postApi(data, AppUrl.resent_otpVeryfyApi);
  }
}
