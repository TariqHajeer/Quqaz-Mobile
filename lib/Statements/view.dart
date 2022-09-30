import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide RxMap;
import 'package:http/http.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:quqaz/Login/controller.dart';

// import 'package:quqaz/Account_Statement/controller.dart';
import 'package:quqaz/Statements/controller.dart';
import 'package:quqaz/Statements/model.dart';
import 'package:quqaz/User_Account/controller.dart';
import 'package:collection/collection.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/signalr_client.dart';

class Statements extends GetView<StatementsController> {
  //
  @override
  Widget build(BuildContext context) {
    controller.records = StatementsModel().obs;

    var r =
        TextEditingController(text: Get.arguments != null ? Get.arguments : '');

    return SafeArea(
        child: Scaffold(
            body: Container(
      color: Color(0xFF505050),
      height: Get.height,
      // width: Get.width,
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // TextButton(
            //   child: Text('Start Start signal'),
            //   onPressed: () async {
            //     var serverUrl =
            //         "http://mohammedhatem-001-site4.itempurl.com/NotificationHub";
            //     var hubConnection = HubConnectionBuilder()
            //         .withUrl(serverUrl,
            //             options: HttpConnectionOptions(
            //               transport: HttpTransportType.LongPolling,
            //               accessTokenFactory: () async {
            //                 return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIxMjkyIiwiVHlwZSI6IkNsaWVudCIsInVuaXF1ZV9uYW1lIjoi2LnZhdmK2YQgMSIsIm5iZiI6MTYzODEyMzgzNCwiZXhwIjoxNjM4MjEwMjM0LCJpYXQiOjE2MzgxMjM4MzR9.M-7k3ysTTFBOQhJTTEziKJ2RwkcZYq-vNSsr7qHJevg';
            //               },
            //               // transport:HttpTransportType.serverSentEvents,
            //             ))
            //         .build();
            //     hubConnection.on('RM', (response) {
            //       print(response);
            //       print('ReceiveMessage');
            //     });
            //     await hubConnection.start();
            //     var url = Uri.parse(
            //         'http://mohammedhatem-001-site4.itempurl.com/api/CStatics/GetNo');
            //     var s = await get(url, headers: {
            //       'Authorization':
            //           'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIxMjkyIiwiVHlwZSI6IkNsaWVudCIsInVuaXF1ZV9uYW1lIjoi2LnZhdmK2YQgMSIsIm5iZiI6MTYzODEyMzgzNCwiZXhwIjoxNjM4MjEwMjM0LCJpYXQiOjE2MzgxMjM4MzR9.M-7k3ysTTFBOQhJTTEziKJ2RwkcZYq-vNSsr7qHJevg'
            //       // 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiIxMjkyIiwiVHlwZSI6IkNsaWVudCIsInVuaXF1ZV9uYW1lIjoi2LnZhdmK2YQgMSIsIm5iZiI6MTYzNjY1MDE4MiwiZXhwIjoxNjM2NzM2NTgxLCJpYXQiOjE2MzY2NTAxODJ9.A4cY7dVGmqTFWOYDdIExzKbmuT4iEV1HuLPMDKQjaDo'}
            //       ,
            //     });
            //
            //     print('complete');
            //     // var s = await hubConnection.invoke('Test', args: ['1','x' ]);
            //
            //     hubConnection.onclose(({error}) => print("Connection Closed"));
            //   },
            // ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              color: Colors.white,
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: r,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "رقم الطباعة",
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      hintTextDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (r.text.isNotEmpty) {
                        FocusScope.of(context).unfocus();

                        Get.defaultDialog(
                          title: "",
                          titlePadding: EdgeInsets.all(0),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Loading...",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              CircularProgressIndicator(),
                            ],
                          ),
                        );
                        await controller.getRecords(int.parse(r.text));
                        Get.back();
                      }
                    },
                    child: Icon(
                      Icons.search,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            GetBuilder<StatementsController>(
              builder: (s) => s.records.value.orders?.isEmpty ?? true
                  ? Container()
                  : Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                              onPressed: () async {
                                await controller.generateAndPrintArabicPdf();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.print),
                                  Text(
                                    " طباعة",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              )),
                        ),
                        Container(
                          color: Colors.white,
                          // width: Get.width,
                          height: Get.height,
                          child: Bill(),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    )));
  }
}

class Bill extends StatelessWidget {
  var c = Get.find<StatementsController>();

  Widget build(BuildContext x) {
    print(Get.width);
    var widths = 432 / 3;
    var widthTow = 432 / 10;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: InteractiveViewer(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: widths,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 25,
                                width: 70,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "رقم الطباعة",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.all(1),
                                height: 25,
                                width: 55,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records.value.printNmber.toString(),
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(1),
                                margin: EdgeInsets.only(right: 1),
                                height: 25,
                                width: 70,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "مستخدم الطابعة",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.all(1),
                                height: 25,
                                width: 55,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(right: 1, left: 1),
                                  child: Text(
                                    c.records.value.printerName ?? "",
                                    style: TextStyle(
                                        fontSize: 9, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(1),
                                margin: EdgeInsets.only(right: 1),
                                height: 25,
                                width: 70,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Text(
                                    " تاريخ الطباعة",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.all(1),
                                height: 25,
                                width: 55,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(right: 3),
                                  child: Text(
                                    c.records.value.date?.split("T")[0] ?? "",
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(1),
                                margin: EdgeInsets.only(right: 1),
                                height: 25,
                                width: 70,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Text(
                                    " وقت الطباعة",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.all(1),
                                height: 25,
                                width: 55,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(right: 3),
                                  child: Text(
                                    DateFormat("h:mma")
                                        .format(
                                          DateTime.parse(
                                            c.records.value.date!,
                                          ),
                                        )
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: widths,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 50),
                            height: 85,
                            width: 85,
                            child: Image(
                              image: AssetImage("images/quqaz.jpeg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 25),
                    Container(
                      width: widths,
                      margin: EdgeInsets.only(right: 35),
                      child: Column(
                        children: [
                          Container(
                            // margin: EdgeInsets.only(right: 35),
                            alignment: Alignment.centerRight,
                            child: Text(
                              "كشف حساب",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            // margin: EdgeInsets.only(right: 35),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_sharp,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                Obx(() => Text(Get.find<GetByTokenController>()
                                        .getByToken
                                        .value
                                        .name ??
                                    "-"))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.red,
                                size: 15,
                              ),
                              Text(
                                Get.find<GetByTokenController>()
                                            .getByToken
                                            .value
                                            .phones ==
                                        null
                                    ? "-"
                                    : Get.find<GetByTokenController>()
                                        .getByToken
                                        .value
                                        .phones![0]
                                        .phone!,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 15,
                    ),
                    Padding(padding: EdgeInsets.only(right: 2)),
                    Text(
                      "اربيل",
                      style: TextStyle(),
                    ),
                    Padding(padding: EdgeInsets.only(right: 2)),
                    Icon(
                      Icons.phone,
                      color: Colors.red,
                      size: 15,
                    ),
                    Padding(padding: EdgeInsets.only(right: 2)),
                    Text(
                      "07514550880 - 07700890880",
                      style: TextStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "ترقيم",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.5,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "رقم الوصل",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.2,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "المحافظة",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.5,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "تاريخ الطلب",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.2,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "الاجمالي",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.1,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "الرسوم",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.5,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "يدفع للعميل",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.5,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          " المبلغ القديم",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.7,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "ملاحظات العميل",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 3,
                      color: Colors.black,
                      child: Container(
                        color: Colors.grey[500],
                        alignment: Alignment.center,
                        child: Text(
                          "ملاحظات",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                // ! Hereee
                Container(
                  width: 668,
                  // height: Get.height,
                  child: Obx(
                    () => ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Get.find<StatementsController>()
                          .records
                          .value
                          .orders!
                          .length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 1);
                      },
                      itemBuilder: (x, i) {
                        return Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  (i + 1).toString(),
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 1.5,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.orders?[i].code ?? "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 1.2,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.orders?[0].country ?? "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 1.5,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.date?.split("T")[0] ?? "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 1.2,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.orders?[0].total
                                          ?.toString() ??
                                      "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 1.1,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.orders?[0].deliveCost
                                          ?.toString() ??
                                      "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 1.5,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.orders?[0].payForClient
                                          ?.toString() ??
                                      "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 1.5,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.orders?[0].lastTotal
                                          ?.toString() ??
                                      "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 1.7,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.orders?[0].clientNote ?? "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 3,
                              color: Colors.black,
                              child: Container(
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Text(
                                  c.records.value.orders?[0].note ?? "-",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1,
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        "-",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 1),
                    Container(
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.5,
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        " العدد",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 1),
                    Container(
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 2.72,
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        "اجمالي كلفة الطلبات",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 1),
                    Container(
                      // margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.22,

                      // margin: EdgeInsets.only(left: 138),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        NumberFormat('###,###')
                            .format(c.records.value.orders!
                                .map((element) => element.total as num)
                                .toList()
                                .reduce((a, b) => a + b)
                                .toDouble())
                            .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 1),
                    Container(
                      // margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.11,

                      // margin: EdgeInsets.only(left: 138),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        NumberFormat('###,###').format(c.records.value.orders!
                            .map((element) => element.deliveCost)
                            .toList()
                            .reduce((a, b) => a! + b!)!
                            .toDouble()),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 1),
                    Container(
                      // margin: EdgeInsets.only(right: 1),
                      padding: EdgeInsets.all(1),
                      height: 20,
                      width: widthTow * 1.48,
                      margin: EdgeInsets.only(left: 270),
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        NumberFormat('###,###').format(c.records.value.orders!
                            .map((element) => element.payForClient)
                            .toList()
                            .reduce((a, b) => a! + b!)!
                            .toDouble()),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1,
                ),
                Obx(
                  () => c.records.value.receipts!.isEmpty
                      ? Container()
                      : Column(
                          children: [
                            Container(
                              width: 666,
                              color: Colors.blue[300],
                              child: Text(
                                "السندات",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 20,
                                    width: widthTow,
                                    color: Colors.black,
                                    child: Container(
                                      color: Colors.grey[500],
                                      alignment: Alignment.center,
                                      child: Text(
                                        "ترقيم",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 20,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                      color: Colors.grey[500],
                                      alignment: Alignment.center,
                                      child: Text(
                                        "رقم السند",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 20,
                                    width: widthTow * 2,
                                    color: Colors.black,
                                    child: Container(
                                      color: Colors.grey[500],
                                      alignment: Alignment.center,
                                      child: Text(
                                        "التاريخ",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 20,
                                    width: widthTow * 2.28,
                                    color: Colors.black,
                                    child: Container(
                                      color: Colors.grey[500],
                                      alignment: Alignment.center,
                                      child: Text(
                                        " حالة السند",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 20,
                                    width: widthTow * 2.5,
                                    color: Colors.black,
                                    child: Container(
                                      color: Colors.grey[500],
                                      alignment: Alignment.center,
                                      child: Text(
                                        "كلفة السند",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 20,
                                    width: widthTow * 2,
                                    color: Colors.black,
                                    child: Container(
                                      color: Colors.grey[500],
                                      alignment: Alignment.center,
                                      child: Text(
                                        "وذلك عن",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 20,
                                    width: widthTow * 4,
                                    color: Colors.black,
                                    child: Container(
                                      color: Colors.grey[500],
                                      alignment: Alignment.center,
                                      child: Text(
                                        "ملاحظات",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: 668,
                              child: Obx(
                                () => ListView.separated(
                                  itemBuilder: (x, i) {
                                    return Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 1),
                                          padding: EdgeInsets.all(1),
                                          height: 20,
                                          width: widthTow,
                                          color: Colors.black,
                                          child: Container(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Text(
                                              (i + 1).toString(),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 1),
                                          padding: EdgeInsets.all(1),
                                          height: 20,
                                          width: widthTow * 1.5,
                                          color: Colors.black,
                                          child: Container(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Text(
                                              c.records.value.receipts?[i].id
                                                      ?.toString() ??
                                                  "-",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 1),
                                          padding: EdgeInsets.all(1),
                                          height: 20,
                                          width: widthTow * 2,
                                          color: Colors.black,
                                          child: Container(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Text(
                                              c.records.value.receipts?[i].date
                                                      ?.split("T")[0] ??
                                                  "-",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 1),
                                          padding: EdgeInsets.all(1),
                                          height: 20,
                                          width: widthTow * 2.28,
                                          color: Colors.black,
                                          child: Container(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Text(
                                              c.records.value.receipts![i]
                                                      .isPay!
                                                  ? "صرف"
                                                  : "قبض",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 1),
                                          padding: EdgeInsets.all(1),
                                          height: 20,
                                          width: widthTow * 2.5,
                                          color: Colors.black,
                                          child: Container(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Text(
                                              c.records.value.receipts?[i]
                                                      .amount
                                                      ?.toString() ??
                                                  "-",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 1),
                                          padding: EdgeInsets.all(1),
                                          height: 20,
                                          width: widthTow * 2,
                                          color: Colors.black,
                                          child: Container(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Text(
                                              c.records.value.receipts?[i]
                                                      .about ??
                                                  "-",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right: 1),
                                          padding: EdgeInsets.all(1),
                                          height: 20,
                                          width: widthTow * 4,
                                          color: Colors.black,
                                          child: Container(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Text(
                                              c.records.value.receipts?[i].note
                                                      .toString() ??
                                                  "-",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  shrinkWrap: true,
                                  itemCount: c.records.value.receipts!.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(height: 1);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1),
                                  height: 20,
                                  width: widthTow * 6.2,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Text(
                                    "اجمالي كلفة السندات",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  // margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 20,
                                  width: widthTow * 6,

                                  margin: EdgeInsets.only(left: 138),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Text(
                                    NumberFormat('###,###')
                                        .format(c.records.value.receipts!
                                            .map((element) => element.amount)
                                            .toList()
                                            .reduce((a, b) => a! + b!)!
                                            .toDouble())
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1),
                                  height: 20,
                                  width: widthTow * 6.2,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Text(
                                    "المبلغ النهائي",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  // margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 20,
                                  width: widthTow * 6,

                                  margin: EdgeInsets.only(left: 138),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      border: Border.all(
                                          color: Colors.black, width: 1)),
                                  child: Text(
                                    NumberFormat('###,###').format((c
                                            .records.value.orders!
                                            .map((element) =>
                                                element.payForClient)
                                            .toList()
                                            .reduce((a, b) => a! + b!)!
                                            .toDouble()) +
                                        (c.records.value.receipts!
                                            .map((element) => element.amount)
                                            .toList()
                                            .reduce(
                                                (a, b) => (a ?? 1) + (b ?? 1))!
                                            .toDouble())),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
