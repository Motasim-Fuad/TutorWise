
import 'package:tutorapp/data/network/network_api_services.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';

class ForgetPasswordRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> forgetpasswordApi(Map<String, dynamic> data) async {
    return await _apiServices.postApi(data, AppUrl.forgetpassApi);
  }

}