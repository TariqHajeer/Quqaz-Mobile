import 'dart:convert';
import 'dart:core';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quqaz/Account_Statement/model.dart';
import 'package:quqaz/Add-Order/model.dart';
import 'package:quqaz/Home/model.dart';
import 'package:quqaz/Home/notifications.dart';
import 'package:quqaz/Intro%20Page/model.dart';
import 'package:quqaz/Login/controller.dart';
import 'package:quqaz/Login/model.dart';
import 'package:quqaz/MyPoints/model.dart';
import 'package:quqaz/Orders/model.dart';
import 'package:quqaz/Payment-Order/model.dart';
import 'package:quqaz/SendOrderToClient/model.dart';
import 'package:quqaz/Show-Order/model.dart';
import 'package:quqaz/Statements/model.dart';
import 'package:quqaz/Statements/view.dart';
import 'package:quqaz/User_Account/controller.dart';
import 'package:quqaz/User_Account/model.dart';

class ApiService {
  //;
  //
  static String uri = "http://mohammedhatem-001-site4.itempurl.com/api/";
  static Future getCountriesHome() async {
    http.Response response = await http.get(
      Uri.parse(uri + "Home/Country"),
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => Countries.fromJson(element)).toList();
    } else {
      return null;
    }
  }
  static Future getClientHome() async {
    http.Response response = await http.get(
      Uri.parse('https://backend.quqaz.com/api/' + 'Home/Market'),
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => ClientsModel.fromJson(element)).toList();
    } else {
      return null;
    }
  }

  //
  static Future getHomeData() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CStatics"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',

        // 'Bearer ${Get.find<LoginController>().user!.value.token}',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = jsonDecode(response.body);
      return CStaticsModel.fromJson(result);
    } else {
      return "ERROR";
    }
  }

  //
  static Future<UserModel?> login(name, password) async {
    http.Response response = await http.post(
      Uri.parse(uri + "ClientAuth"),
      body: jsonEncode({'UserName': name, 'Password': password}),
      headers: {"Content-Type": "application/json"},
    );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      var result = jsonDecode(response.body);
      return UserModel.fromJson(result);
    } else {
      return null;
    }
  }

  //
  static Future<bool?> checkCode(int code) async {
    http.Response response = await http.get(
      Uri.parse(uri + "COrder/codeExist?code=$code"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body == "true";
    } else {
      return null;
    }
  }

  //
  static Future getCountriesAndOrderType() async {
    //
    http.Response response1 = await http.get(
      Uri.parse(uri + "CSettingsGet/Countries"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
      },
    );
    //
    http.Response response2 = await http.get(
      Uri.parse(uri + "CSettingsGet/orderType"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
      },
    );
    //
    if (response1.statusCode == 200 && response2.statusCode == 200) {
      //
      List result1 = jsonDecode(response1.body);
      //
      List result2 = jsonDecode(response2.body);

      //
      var one = result1.map((element) => Countries.fromJson(element)).toList();
      //
      var tow = result2.map((element) => OrderType.fromJson(element)).toList();
      //
      return [one, tow];
      //
    } else {
      return null;
    }
  }

  ///
  static Future postCOrder(MyForm m) async {
    http.Response response = await http.post(
      Uri.parse(uri + "COrder"),
      body: jsonEncode(
        {
          'code': m.code,
          'countryId': m.countryId,
          'address': m.address,
          "recipientName": m.recipientName ?? "",
          "clientNote": m.clientNote,
          "cost": m.cost,
          "date": m.date,
          "orderItem": m.orderItem ?? null,
          "recipientPhones": m.recipientPhones
        },
      ),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
  //

  static Future getRegions() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CSettingsGet/Regions"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => Regions.fromJson(element)).toList();
    } else {
      return null;
    }
  }

  static Future getCountries() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CSettingsGet/Countries"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
      },
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => Countries.fromJson(element)).toList();
    } else {
      return null;
    }
  }
  //

  static Future getOrderPlaced() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CSettingsGet/OrderPlaced"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => Template.fromJson(element)).toList();
    } else {
      return null;
    }
  }

  static Future getMoenyPlaced() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CSettingsGet/MoenyPlaced"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => Template.fromJson(element)).toList();
    } else {
      return null;
    }
  }

  //
  static Future getCOrder(
    int? page,
    int? code,
    int? phone,
    int? countryId,
    int? regionId,
    String? recipientName,
    int? monePlacedId,
    int? orderplacedId,
  ) async {
    print(orderplacedId);
    print(
        "COrder?RowCount=6&Page=${page ?? 1}&Code=${code ?? ""}&Phone=${phone ?? ""}&CountryId=${countryId ?? ""}&RegionId=${regionId ?? ""}&RecipientName=${recipientName ?? ""}&MonePlacedId=${monePlacedId ?? ""}&OrderplacedId=${orderplacedId ?? ""}");
    http.Response response = await http.get(
      Uri.parse(uri +
          "COrder?RowCount=6&Page=${page ?? 1}&Code=${code ?? ""}&Phone=${phone ?? ""}&CountryId=${countryId ?? ""}&RegionId=${regionId ?? ""}&RecipientName=${recipientName ?? ""}&MonePlacedId=${monePlacedId ?? ""}&OrderplacedId=${orderplacedId ?? ""}"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return COrder.fromJson(result);
    } else {
      return null;
    }
  }

  //
  static Future getCOrderDetails(int id) async {
    http.Response response = await http.get(
      Uri.parse(uri + "COrder/$id"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return COrderDModel.fromJson(result);
    } else {
      return null;
    }
  }
  //

  static Future putCOrder(MyForm m, int id) async {
    http.Response response = await http.put(
      Uri.parse(uri + "COrder"),
      body: jsonEncode(
        {
          'id': id,
          'code': m.code,
          'countryId': m.countryId,
          'address': m.address,
          "recipientName": m.recipientName,
          "clientNote": m.clientNote,
          "cost": m.cost,
          "date": m.date,
          "orderItem": m.orderItem!.value,
          "recipientPhones": m.recipientPhones,
        },
      ),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    print(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Success update");
      return true;
    } else {
      return false;
    }
  }

  //
  //

  static Future<List<SendOrder>?> getSendOrders() async {
    http.Response response = await http.get(
      Uri.parse(uri + "COrder/NonSendOrder"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => SendOrder.fromJson(element)).toList();
    }
    return null;
  }
  //

  static Future postSendOrders(List<int> list) async {
    http.Response response = await http.post(
      Uri.parse(uri + "COrder/Sned"),
      body: jsonEncode(list),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //
  //
  static Future deleteSendOrder(int id) async {
    http.Response response = await http.delete(
      Uri.parse(uri + "COrder/$id"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    inspect(response);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //
  static Future<int?> getMyPoint() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CPoint/MyPoints"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      return int.parse(response.body);
    }
    return null;
  }

  //
  static Future<List<CPoint>?> getCPoint() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CPoint"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => CPoint.fromJson(element)).toList();
    }
    return null;
  }

  //
  //
  static Future<GetByToken?> getGetByToken() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CClient/GetByToken"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      var t = jsonDecode(response.body);
      return GetByToken.fromJson(t);
    }
    return null;
  }
  //
  //
  //

  static Future updateInformation(FormUpdate update) async {
    http.Response response = await http.put(
      Uri.parse(uri + "CClient/updateInformation"),
      body: jsonEncode({
        "mail": update.mail,
        "password": update.password,
        "phones": update.phones,
        "name": update.name,
        "userName": update.userName
      }),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    print(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Success update");
      return true;
    } else {
      return false;
    }
  }

  ///////////
  ///
  ///
  ///
  ///
  static Future<bool> checkName(String name) async {
    http.Response response = await http.get(
      Uri.parse(uri + "CClient/CheckName/$name"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body == 'true' ? true : false;
    } else {
      return false;
    }
  }

  //
  static Future<bool> checkUserName(String name) async {
    http.Response response = await http.get(
      Uri.parse(uri + "CClient/CheckUserName/$name"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return response.body == 'true' ? true : false;
    } else {
      return false;
    }
  }

  //
  //
  static Future<bool> checkTokenValidate(String t) async {
    http.Response response = await http.get(
      Uri.parse(uri + "CClient/GetByToken"),
      headers: {
        'Authorization': 'Bearer $t',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      Get.find<GetByTokenController>().getByToken.value =
          GetByToken.fromJson(jsonDecode(response.body));

      return true;
    }
    return false;
  }
  //
  //
  //

  static Future<List<PaymentOrderModel>?> getPaymentsOrder() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CPaymentRequest/GetPaymentWay"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result
          .map((element) => PaymentOrderModel.fromJson(element))
          .toList();
    } else {
      return null;
    }
  }
  //
  //

  static Future<bool> postCPaymentRequest(FormPayment m) async {
    http.Response response = await http.post(
      Uri.parse(uri + "CPaymentRequest"),
      body: jsonEncode({
        "paymentWayId": m.paymentWayId,
        "note": m.note,
        "date": DateTime.now().toIso8601String().toString(),
      }),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    // print(response.statusCode);
    inspect(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Success update");
      return true;
    } else {
      return false;
    }
  }

  //
  //

  static Future<CPaymentRequestModel?> getCPaymentRequests(
    int? page,
  ) async {
    http.Response response = await http.get(
      Uri.parse(uri + "CPaymentRequest?RowCount=6&Page=${page ?? 1}"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return CPaymentRequestModel.fromJson(result);
    } else {
      return null;
    }
  }

  //
  //
  //
  static Future<bool> deletePaymentsOrder(int id) async {
    http.Response response = await http.delete(
      Uri.parse(uri + "CPaymentRequest/$id"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    inspect(response);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //
  static Future<List<CheckB>?> getCheckBoxes() async {
    http.Response response = await http.get(
      Uri.parse(uri + "CSettingsGet/OrderPlaced"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      var t = result.map((element) => CheckB.fromJson(element)).toList();
      print(t.length);
      return t;
    } else {
      return null;
    }
  }

  //
  //
  //
  static Future<List<Documentss>?> getDocuments() async {
    http.Response response = await http.get(
      Uri.parse(uri + "COrder/UnPaidRecipt"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      var t = result.map((element) => Documentss.fromJson(element)).toList();
      print(t.length);
      return t;
    } else {
      return null;
    }
  }
  //
  //
  //

  static Future<List<Record>?> getRecords(
    List<int?> orderPlacedId,
    bool? isClientDeleviredMoney,
    bool? clientDoNotDeleviredMoney,
  ) async {
    String v = "";
    orderPlacedId.forEach(
      (element) {
        if (element != 0) v += "OrderPlacedId=" + element.toString() + "&";
      },
    );
    print(v);
    print(
        "${v}ClientDoNotDeleviredMoney=$clientDoNotDeleviredMoney&IsClientDeleviredMoney=$isClientDeleviredMoney");

    http.Response response = await http.get(
      Uri.parse(uri +
          "COrder/OrdersDontFinished?${v}ClientDoNotDeleviredMoney=${clientDoNotDeleviredMoney ?? false}&IsClientDeleviredMoney=${isClientDeleviredMoney ?? false}"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result.map((element) => Record.fromJson(element)).toList();
    } else {
      return null;
    }
    //
    //
    //
  }

  ///////
  static Future<StatementsModel?> getStatements(int? code) async {
    http.Response response = await http.get(
      Uri.parse(uri + "Print/$code"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return StatementsModel.fromJson(result);
    } else {
      return null;
    }
  }

  ////////////////
  ///
  static Future<List<NotificationsModel>?> getMessages() async {
    http.Response response = await http.get(
      Uri.parse(uri + "COrder/Notifcation"),
      headers: {
        'Authorization': 'Bearer ${Get.find<LoginController>().token}',
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      List result = jsonDecode(response.body);
      return result
          .map((element) => NotificationsModel.fromJson(element))
          .toList();
    } else {
      return null;
    }
    //
    //
    //
  }

  ///
}
