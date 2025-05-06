import 'package:tutorapp/data/network/network_api_services.dart';
import 'package:tutorapp/resources/app_url/app_url.dart';

class SignUpRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> signupApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.singUpApi);
    return response;
  }
}
