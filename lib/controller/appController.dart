import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:quqaz/Login/controller.dart';
import 'package:quqaz/Orders/model.dart';
import 'package:quqaz/notification/model.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/signalr_client.dart';

class AppController extends GetxController {
  List<Notifications> dataNoti = [];
  DataNotificationModel? dataNotificationModel;

  RxInt _lengthNoti = 0.obs;
  get lengthNoti => this._lengthNoti.value;
  set lengthNoti(value) => this._lengthNoti.value = value;
  connectionToNotification() async {
    var serverUrl =
        "http://mohammedhatem-001-site4.itempurl.com/NotificationHub";
    var hubConnection = HubConnectionBuilder()
        .withUrl(serverUrl,
            options: HttpConnectionOptions(
              transport: HttpTransportType.LongPolling,
              accessTokenFactory: () async {
                return '${Get.find<LoginController>().token}';
              },
              // transport:HttpTransportType.serverSentEvents,
            ))
        .build();
    hubConnection.on('RM', (var response) {
      print(response);
      Map<String, dynamic> user = jsonDecode(response![0].toString());
      dataNotificationModel = DataNotificationModel.fromJson(user);
      if (dataNoti.isEmpty) {
        dataNoti = dataNotificationModel!.notifications!;
      } else {
        dataNoti.insert(0, Notifications.fromJson(user['notifications'][0]));
      }
      lengthNoti = dataNoti.length;
    });
    await hubConnection.start();
    var url = Uri.parse(
        'http://mohammedhatem-001-site4.itempurl.com/api/CStatics/GetNo');
    var s = await get(url, headers: {
      'Authorization': 'Bearer ${Get.find<LoginController>().token}',
    }).then((value) => print("x"));
    // print('sssss : ${s.body}');

    // var s = await hubConnection.invoke('Test', args: ['1','x' ]);

    hubConnection.onclose(({error}) => print("Connection Closed"));
  }
}
