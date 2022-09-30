import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Login/controller.dart';
import 'package:quqaz/controller/appController.dart';
import 'package:signalr_netcore/itransport.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController {
  AppController appController = Get.find();
  List<int> idNotification = [];
  @override
  void onInit() {
    super.onInit();
  }

  // @override
  // void dispose() {
  //   print('hammmmed');
  //   appController.dataNoti = [];
  //   appController.lengthNoti = 0;
  //   super.dispose();
  // }

  @override
  void onClose() async {
    for (var x in appController.dataNoti) {
      idNotification.add(x.id!);
    }
    if (await seeNotification()) {
      appController.dataNoti = [];
      appController.lengthNoti = -1;
    }
    super.dispose();
  }

  Future seeNotification() async {
    http.Response response =
        await http.put(Uri.parse(ApiService.uri + "COrder/SeeNotifactions"),
            headers: {
              'Authorization': 'Bearer ${Get.find<LoginController>().token}',
              "content-type": "application/json",
              "accept": "*/*"
            },
            body: idNotification.toString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
