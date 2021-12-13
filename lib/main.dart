import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  AwesomeNotifications().createdStream.listen((event) {
    Get.snackbar(
      'Created Notification',
      'Notification Created on ${event.channelKey}',
      snackPosition: SnackPosition.BOTTOM,
    );
  });

  AwesomeNotifications().actionStream.listen((event) {
    Get.toNamed(Routes.BIDDING);
  });
  
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'test_channel',
      channelName: 'Test Notificatioin',
      channelDescription: 'Notification for basic',
    ),
    NotificationChannel(
      channelKey: 'scheduled_channel',
      channelName: 'Scheduled Notifications',
      channelDescription: 'Scheduled Notification for basic',
    ),
  ]);

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      onInit: () {
        AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
          if (!isAllowed) {
            AwesomeNotifications().requestPermissionToSendNotifications();
          }
        });
      },
    ),
  );
}
