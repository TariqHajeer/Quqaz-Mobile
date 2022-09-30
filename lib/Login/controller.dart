import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quqaz/API/ApiService.dart';
import 'model.dart';

class LoginController extends GetxController {
  //
  Rx<UserModel>? user = UserModel().obs;
  Rx<bool> loading = false.obs;
  //
  String token = "";
  //
  Future login<bool>(String name, String password) async {
    loading.value = true;
    var result = await ApiService.login(name, password);
    loading.value = false;
    if (result == null)
      return false;
    else {
      user!.value = result;
      GetStorage box = GetStorage();
      box.write('token', user!.value.token);
      token = user!.value.token!;
      inspect(user);
      return true;
    }
  }
  //
}
