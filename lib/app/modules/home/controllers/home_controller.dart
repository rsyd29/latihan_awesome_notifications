import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';
import 'package:latihan_awesome_notifications/app/routes/app_pages.dart';

import '../../../../utilities.dart';

class HomeController extends GetxController {
  final id = Random().nextInt(10000);

  void sendNotifications() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'test_channel',
        title: 'Title of the notifications.',
        body: 'Hello! This is the body of the notifications.',
      ),
    );
  }

  Future<void> scheduledNotifications(
      NotificationWeekAndTime notificationSchedule) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: 'Title of the scheduled notifications.',
        body: 'Hello! This is the body of the scheduled notifications.',
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        )
      ],
      schedule: NotificationCalendar(
        weekday: notificationSchedule.dayOfTheWeek,
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }

  Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAllSchedules();
  }
}
