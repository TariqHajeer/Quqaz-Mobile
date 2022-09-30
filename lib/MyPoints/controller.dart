import 'package:get/get.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Add-Order/model.dart';
import 'package:quqaz/MyPoints/model.dart';

class MyPointController extends GetxController {
  //
  RxDouble? mypoint = 0.0.obs;
  RxDouble? roundMoney = 0.0.obs;
  RxDouble? remainingPoints = 0.0.obs;

  //
  RxList<CPoint>? cpoints = <CPoint>[].obs;

  //
  RxBool isLoading1 = false.obs;

  //
  RxList<Countries> countries = <Countries>[].obs;

  // @override
  // void onReady() {
  //   super.onReady();
  //   print("Here On Ready");
  //   getMyPoint();
  // }
  Future getCountries() async {
    var result = await ApiService.getCountries();
    print(result);
    if (result != null) {
      countries.value = result;
    }
  }

  //
  Future getMyPoint() async {
    getCountries();
    isLoading1.value = true;
    var result = await ApiService.getMyPoint();
    var result2 = await ApiService.getCPoint();


    if (result != null && result2 != null) {
      mypoint!.value = result.toDouble();
      cpoints!.value = result2;
      for (int i = 0; i < result2.length; i++)
        if (result2[i].money! < mypoint!.value)
          roundMoney!.value = result2[i].money!.toDouble();
      // roundMoney!.value =
      //     cpoints!
      //     .where((e) => e.money! < mypoint!.value)
      //     .last
      //     .money!
      //     .toDouble();
      for (int i = 0; i < result2.length; i++)
        if (result2[i].money! == mypoint!.value)
          remainingPoints!.value =
              mypoint!.value - result2[i].money!.toDouble();
      // remainingPoints!.value = mypoint!.value -
      //     cpoints!.where((e) => e.money == roundMoney!.value).first.points!;
    }
    isLoading1.value = false;
  }

//
}
