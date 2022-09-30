import 'package:get/get.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Add-Order/model.dart';

class AddOrderController extends GetxController {
  //
  RxList<Countries> countries = <Countries>[].obs;
  //
  RxList<OrderType> orderTypes = <OrderType>[].obs;
  RxList<OrderType> tempOrderTypes = <OrderType>[].obs;

  //
  RxBool isLoading = false.obs;
  //
  //
  Rx<MyForm> myForm = MyForm().obs;
  //
  // @override
  // void onReady() {
  //   super.onReady();
  //   print("Here On Ready");
  //   getCountries();
  // }

  //

  //

  //
  Future getCountries() async {
    var result = await ApiService.getCountriesAndOrderType();
    // print(result);
    print("Fetch Countries");
    if (result != null) {
      countries.value = result[0];
      orderTypes.value = result[1];
      tempOrderTypes.value = List.from(orderTypes);
    }
  }

  //
  Future checkCode(code) async {
    isLoading.value = true;
    var result = await ApiService.checkCode(int.parse(code));
    isLoading.value = false;
    if (result != null) return result;
  }

  //
  Future postCOrder() async {
    isLoading.value = true;
    var result = await ApiService.postCOrder(myForm.value);
    if (result) {
      await Get.delete<AddOrderController>();
      Get.put(AddOrderController());
      update();
    }
    isLoading.value = false;
    return result;
  }
}
