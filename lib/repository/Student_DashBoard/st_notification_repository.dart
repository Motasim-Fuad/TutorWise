import '../../../data/network/network_api_services.dart';
import '../../../resources/app_url/app_url.dart';

import '../../models/Student/st_notification_model.dart';

class StNotificationRepository {
  final _apiService = NetworkApiServices();

  Future<List<NotificationModel>> fetchNotifications() async {
    final response = await _apiService.getApi(AppUrl.notificationUrl);
    print('notification response:$response');
    final List<dynamic> dataList = response['data'];
    return dataList.map((json) => NotificationModel.fromJson(json)).toList();
  }
}
