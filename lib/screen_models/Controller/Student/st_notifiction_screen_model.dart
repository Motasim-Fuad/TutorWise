import 'package:get/get.dart';

import '../../../models/Student/st_notification_model.dart';
import '../../../repository/Student_DashBoard/st_notification_repository.dart';

class StNotificationScreenModel extends GetxController {
  final notifications = <NotificationModel>[].obs;
  final isLoading = true.obs;

  final _repo = StNotificationRepository();

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  void fetchNotifications() async {
    isLoading.value = true;
    try {
      final result = await _repo.fetchNotifications();
      notifications.assignAll(result);
    } finally {
      isLoading.value = false;
    }
  }
}
