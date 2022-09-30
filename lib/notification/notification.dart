import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quqaz/controller/appController.dart';
import 'package:quqaz/notification/controller.dart';
import 'package:quqaz/notification/notificationcard.dart';
import 'package:signalr_netcore/itransport.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController appController = Get.find();
    NotificationController notificationController =
        Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: Text('الإشعارات'),
        shadowColor: Colors.grey,
        backgroundColor: Color(0xFF2F353A),
      ),
      body: Container(
        child: Obx(() {
          if (appController.lengthNoti == -1) {
            return Center(
              child: Text('لا يوجد بيانات'),
            );
          } else if (appController.lengthNoti > 0) {
            return ListView.builder(
              itemCount: appController.lengthNoti,
              itemBuilder: (context, index) {
                return NotificationCard(index: index);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
