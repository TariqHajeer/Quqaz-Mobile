import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Payment-Order/model.dart';

// import 'package:quqaz/Show-Order/model.dart';
class PaymentController extends GetxController {
  //
  var key = GlobalKey<FormState>();
  //
  PaymentOrderModel? t3;
  //
  TextEditingController? notes = TextEditingController();
  //
  RxInt index = 1.obs;
  //
  RxInt resultIndex = 0.obs;
  //
  RxList<PaymentOrderModel> payments = <PaymentOrderModel>[].obs;
  //
  RxBool isLoading = false.obs;
  //
  Rx<FormPayment> myForm = FormPayment().obs;
  //
  Rx<CPaymentRequestModel> cPaymentRequests = CPaymentRequestModel().obs;

  //
  Future getPayments() async {
    var result = await ApiService.getPaymentsOrder();
    if (result != null) {
      payments.value = result;
    }
  }

  //
  Future<bool> postPayemntsOrder() async {
    // isLoading.value = true;
    var result = await ApiService.postCPaymentRequest(myForm.value);
    if (result) {
      notes!.text = "";
      t3 = null;
      myForm = FormPayment().obs;
      return true;
      // await Get.delete<GetCOrder>();
      // Get.put(GetCOrder());
      // update();
    }
    // isLoading.value = false;
    return result;
  }

  //
  Future getCPaymentRequests({
    int? page,
  }) async {
    isLoading.value = true;
    var result = await ApiService.getCPaymentRequests(
      page,
    );
    isLoading.value = false;

    if (result != null) {
      cPaymentRequests.value = result;
      resultIndex.value =
          int.parse(cPaymentRequests.value.total.toString()) ~/ 6;
    }
  }
}
