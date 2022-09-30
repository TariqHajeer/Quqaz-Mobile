import 'package:get/get.dart';
import 'package:quqaz/Account_Statement/controller.dart';
import 'package:quqaz/Home/controller.dart';
import 'package:quqaz/Intro%20Page/controller.dart';
import 'package:quqaz/Login/controller.dart';
import 'package:quqaz/MyPoints/controller.dart';
import 'package:quqaz/Payment-Order/controller.dart';
import 'package:quqaz/Statements/controller.dart';
import 'package:quqaz/User_Account/controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AccountStatements());
    Get.put(HomeController());
    Get.put(LoginController());
    Get.put(MyPointController());
    Get.put(IntroController());
    // Get.put(GetByTokenController());
    Get.put(PaymentController());
    Get.put(StatementsController());
  }
}
