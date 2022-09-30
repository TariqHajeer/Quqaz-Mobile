import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/User_Account/model.dart';

class GetByTokenController extends GetxController {
  //
  Rx<FormUpdate> form = FormUpdate().obs;
  //
  Rx<GetByToken> getByToken = GetByToken().obs;
  //
  Rx<bool> v = false.obs;
  //
  RxBool isLoading = false.obs;
  //
  var name = TextEditingController();
  //
  var userName = TextEditingController();
  //
  var email = TextEditingController();
  //
  var newPassword = TextEditingController();
  //
  var tnp = TextEditingController();
  //
  @override
  onReady() {
    super.onReady();
    // getData();
  }

  //
  Future getData() async {
    isLoading.value = true;
    getByToken = GetByToken().obs;
    var result = await ApiService.getGetByToken();
    isLoading.value = false;
    if (result != null) {
      getByToken.value = result;
      form.value.phones =
          getByToken.value.phones!.map((element) => element.phone!).toList();
      name.text = getByToken.value.name!;
      userName.text = getByToken.value.userName!;
      email.text = getByToken.value.mail;
    }
  }

  //
  Future updateInformation() async {
    isLoading.value = true;
    var result = await ApiService.updateInformation(form.value);
    isLoading.value = false;
    return result;
  }
  //
}
