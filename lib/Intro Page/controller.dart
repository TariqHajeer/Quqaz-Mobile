import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Add-Order/model.dart';
import 'model.dart';

class IntroController extends GetxController {
  RxList<Countries> countries = <Countries>[].obs;
  RxInt countrieslength = 0.obs;

  RxList<ClientsModel> client = <ClientsModel>[].obs;
  RxInt clientlength = 0.obs;



  Future getCountries() async {
    var result = await ApiService.getCountriesHome();
    if (result != null) {
      countries.value = result;
      countrieslength.value = countries.length;
    }
  }

  Future getClient() async {
    var result = await ApiService.getClientHome();
    print('result : $result');
    if (result != null) {
      client.value = result;
      clientlength.value = countries.length;
    }
  }

  @override
  void onInit() {
    super.onInit();
    print('oooooooooooo');
    getCountries();
    getClient();
  }
}
