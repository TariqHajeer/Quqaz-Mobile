import 'package:get/get.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/SendOrderToClient/model.dart';

class SendOrderController extends GetxController {
  //
  RxList<SendOrder> sendOrders = <SendOrder>[].obs;
  RxBool isLoading1 = false.obs;
  RxBool isLoading2 = false.obs;

  // //
  // @override
  // void onReady() {
  //   super.onReady();
  //   print("Here On Ready");
  //   getSendOrders();
  // }

  //
  Future getSendOrders() async {
    isLoading1.value = true;
    var result = await ApiService.getSendOrders();
    isLoading1.value = false;
    if (result != null) {
      sendOrders.value = result;
    }
  }

  //
  Future postSendOrders() async {
    List<int> v = [];
    sendOrders.forEach((element) {
      v.add(element.id!);
    });
    var result = await ApiService.postSendOrders(v);
    return result;
  }
  //
}
