import 'package:get/get.dart';
import 'package:tutorapp/data/network/network_api_services.dart';

import 'package:tutorapp/resources/app_url/app_url.dart';

import '../../models/Student/Show_hireTutorInformationModel.dart';

class HireTutorRepository {
  final _apiService = NetworkApiServices();

  Future<List<HireTutorInformationModel>> fetchHireTutorList() async {
    try {
      final response = await _apiService.getApi(AppUrl.stShowHireTutorList);
      print("hire tutor repo response:$response");
      //final data = response['data'] as List;
      // return data.map((e) => HireTutorInformationModel.fromJson(e)).toList();


      final data = response['data'] ;
      return [HireTutorInformationModel.fromJson(data)];

    } catch (e) {
      rethrow;
    }
  }
}
