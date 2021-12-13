import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:latihan_awesome_notifications/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final id = Random().nextInt(10000);
  void sendNotifications() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'test_channel',
        title: 'Title of the notifications.',
        body: 'Hello! This is the body of the notifications.',
      ),
    );

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
  }
}
