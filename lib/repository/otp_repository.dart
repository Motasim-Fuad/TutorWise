
import 'package:tutorapp/data/network/network_api_services.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';

class OtpRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> verifyOtpApi(Map<String, dynamic> data) async {
    return await _apiServices.postApi(data, AppUrl.otp_verifyApi);
  }

  Future<dynamic> resendOtpApi(Map<String, dynamic> data) async {
    return await _apiServices.postApi(data, AppUrl.resent_otpVeryfyApi);
  }
}
