import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Home/model.dart';
import 'package:quqaz/Home/notifications.dart';
import 'package:quqaz/controller/appController.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  AppController appController= Get.find();
    
  //
  RxList<NotificationsModel> nots = <NotificationsModel>[].obs;
  //
  Rx<ScrollController> scrollController = ScrollController().obs;
  //
  Timer? _timer;
  //
  RxBool isLoadingNot = false.obs;

  //
  @override
  void onInit() {
    super.onInit();
    appController.connectionToNotification();
    // _timer = Timer.periodic(Duration(seconds: 2), (timer) async {
    //   print("fetch Messages");
    //   await fetchMessages();
    // });
  }
  //
  // //
  // @override
  // void dispose() {
  //   _timer!.cancel();
  //   print("Dispose");
  //   super.dispose();
  // }

  //
  RxInt index = 1.obs;
  //
  var homeList = CStaticsModel().obs;
  //
  RxBool isLoadingHomeList = false.obs;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  fetchMessages() async {
    isLoadingNot.value = true;
    var r = await ApiService.getMessages();
    isLoadingNot.value = false;

    if (r != null) {
      nots.value = r;
    }
  }

  //
  getHome() async {
    isLoadingHomeList.value = true;
    var response = await ApiService.getHomeData();
    inspect(response);
    if (response != "ERROR") homeList.value = response;
    isLoadingHomeList.value = false;
  }
}
