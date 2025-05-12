import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago show format;

import '../../../resources/app_url/app_url.dart';

import '../../screen_models/Controller/Student/st_notifiction_screen_model.dart';

class StNotificationScreen extends StatelessWidget {
  final controller = Get.put(StNotificationScreenModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.notifications.isEmpty) {
          return Center(child: Text("No notifications found"));
        }

        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            final notification = controller.notifications[index];

            return Card(
              color: notification.isRead ? Colors.white : Colors.blue.shade50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: notification.imageUrl != null && notification.imageUrl!.isNotEmpty
                      ? NetworkImage("${AppUrl.baseurl}${notification.imageUrl}")
                      : null,
                  child: notification.imageUrl == null || notification.imageUrl!.isEmpty
                      ? Icon(Icons.notifications)
                      : null,
                ),
                title: Text(
                  notification.title,
                  style: TextStyle(
                    fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
                  ),
                ),
                subtitle: Text(notification.message),
                trailing: Text(
                  timeago.format(notification.createdAt),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
