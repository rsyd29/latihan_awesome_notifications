import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan_awesome_notifications/utilities.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.sendNotifications();
              },
              child: Text('Send Notifications'),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () async {
                NotificationWeekAndTime? pickedSchedule =
                    await pickSchedule(context);

                if (pickedSchedule != null) {
                  controller.scheduledNotifications(pickedSchedule);
                }
              },
              child: Text('Scheduled Notifications'),
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                controller.cancelNotifications();
              },
              child: Text('Cancel All Notifications'),
            ),
          ],
        ),
      ),
    );
  }
}
