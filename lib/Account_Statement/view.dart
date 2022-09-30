import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:quqaz/Account_Statement/controller.dart';
import 'package:quqaz/User_Account/controller.dart';

import 'model.dart';

//
class StatementsByType extends GetView<AccountStatements> {
  //
  @override
  Widget build(BuildContext context) {
    //
    controller.getCheckBoxes();
    controller.isClientDeleviredMoney = false.obs;
    controller.clientDoNotDeleviredMoney = false.obs;
    controller.list = <bool>[].obs;
    controller.documents = <Documentss>[].obs;
    controller.records = <Record>[].obs;
    controller.checks = <CheckB>[].obs;

    // controller.getRecords();
    //
    print(controller.records.isEmpty);
    return Container(
      color: Color(0xFF505050),
      height: Get.height,
      // width: Get.width,
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                  Obx(
                    () => GridView.builder(
                      itemCount: controller.checks.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // crossAxisSpacing: 5.0,
                        mainAxisExtent: Get.height * 0.1,
                        mainAxisSpacing: 5.0,
                      ),
                      itemBuilder: (x, i) {
                        return Obx(() => CheckboxListTile(
                              value: controller.list[i]!,
                              dense: true,
                              onChanged: (s) async {
                                controller.list[i] = !(controller.list[i]!);
                                if (s!) {
                                  controller.orderPlacedId.add(
                                    controller.checks[i].id!,
                                  );
                                } else {
                                  controller.orderPlacedId.remove(
                                    controller.checks[i].id!,
                                  );
                                }
                                if (controller.orderPlacedId
                                        .any((element) => element != 0) &&
                                    (controller.isClientDeleviredMoney!.value ||
                                        controller.clientDoNotDeleviredMoney!
                                            .value)) {
                                  Get.defaultDialog(
                                    title: "",
                                    titlePadding: EdgeInsets.all(0),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                  await controller.getRecords();
                                  Get.back();
                                }
                              },
                              title: Text(
                                controller.checks[i].name!,
                                style: TextStyle(fontSize: Get.width * 0.04),
                                textAlign: TextAlign.right,
                              ),
                            ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    height: 6,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  Obx(
                    () => CheckboxListTile(
                      value: controller.clientDoNotDeleviredMoney!.value,
                      dense: true,
                      onChanged: (s) async {
                        controller.clientDoNotDeleviredMoney!.value =
                            !(controller.clientDoNotDeleviredMoney!.value);
                        if (controller.orderPlacedId
                                .any((element) => element != 0) &&
                            (controller.isClientDeleviredMoney!.value ||
                                controller.clientDoNotDeleviredMoney!.value)) {
                          print("get records");
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
                          await controller.getRecords();
                          Get.back();
                        }
                      },
                      title: Text(
                        "لم يتم تسديد المبلغ مسبقاً",
                        style: TextStyle(fontSize: Get.width * 0.04),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  Obx(
                    () => CheckboxListTile(
                      value: controller.isClientDeleviredMoney!.value,
                      dense: true,
                      onChanged: (s) async {
                        controller.isClientDeleviredMoney!.value =
                            !(controller.isClientDeleviredMoney!.value);
                        if (controller.orderPlacedId
                                .any((element) => element != 0) &&
                            (controller.isClientDeleviredMoney!.value ||
                                controller.clientDoNotDeleviredMoney!.value)) {
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
                          await controller.getRecords();
                          Get.back();
                        }
                      },
                      title: Text(
                        "تسديد المبلغ ",
                        style: TextStyle(fontSize: Get.width * 0.04),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            GetBuilder<AccountStatements>(
              builder: (s) => s.records.isEmpty
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
                          // height: Get.height,
                          child: Bill(),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
  }
}

class Bill extends StatelessWidget {
  var c = Get.find<AccountStatements>();

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
                                    "مستخدم الطابعة",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                padding: EdgeInsets.all(1),
                                // height: 25,
                                // width: 55,
                                color: Colors.black,
                                child: Container(
                                  color: Colors.white,
                                  alignment: Alignment.center,
                                  child: Text(
                                    Get.find<GetByTokenController>()
                                            .getByToken
                                            .value
                                            .name ??
                                        "",
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
                                  padding: EdgeInsets.only(right: 1, left: 1),
                                  child: Text(
                                    DateTime.now().toString().split(" ")[0],
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
                                    DateFormat("h:mma")
                                        .format(
                                          DateTime.now(),
                                        )
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 8, color: Colors.black),
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
                // ! Hereee
                Container(
                  width: 800,
                  // height: Get.height,
                  child: Obx(
                    () => ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: Get.find<AccountStatements>().records.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 1);
                      },
                      itemBuilder: (x, i) {
                        return i == 0
                            ? Column(children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "ترقيم",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "رقم الوصل",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "المحافظة",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "تاريخ الطلب",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "الإجمالي",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "الرسوم",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "يدفع للعميل",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "المبلغ القديم",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      // height: 50,
                                      // width: widthTow,
                                      width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 1),
                                              padding: EdgeInsets.all(1),
                                              height: 20,
                                              color: Colors.black,
                                              child: Container(
                                                color: Colors.grey[500],
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "ملاحظات العميل",
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(right: 1),
                                        padding: EdgeInsets.all(1),
                                        // height: 50,
                                        // width: widthTow,
                                        // width: widthTow * 1.5,
                                        color: Colors.black,
                                        child: Container(
                                            color: Colors.white,
                                            alignment: Alignment.center,
                                            child: Column(children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(right: 1),
                                                padding: EdgeInsets.all(1),
                                                height: 20,
                                                color: Colors.black,
                                                child: Container(
                                                  color: Colors.grey[500],
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "ملاحظات",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ])),
                                      ),
                                    )
                                  ],
                                ),
                                Row(children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            // TODO remove todo Add plus
                                            (i + 1).toString(),
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].code!,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].country!.name ?? "-",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].date?.split("T")[0] ??
                                                "-",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].cost?.toString() ??
                                                "-",
                                            // c.records[i].date?.split("T")[0] ?? "-",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].deliveryCost
                                                    ?.toString() ??
                                                "-",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].payForClient
                                                    ?.toString() ??
                                                "-",
                                            // c.records[i].deliveryCost?.toString() ?? "-",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].oldCost?.toString() ??
                                                "-",
                                            // c.records[i].payForClient?.toString() ?? "-",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].clientNote ?? "-",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 1),
                                      padding: EdgeInsets.all(1),
                                      height: 30,
                                      // width: widthTow,
                                      // width: widthTow * 1.5,
                                      color: Colors.black,
                                      child: Container(
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                          child: Column(children: [
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              c.records[i].note ?? "-",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                            ),
                                          ])),
                                    ),
                                  )
                                ])
                              ])
                            : Row(children: [
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          // TODO remove todo Add plus
                                          (i + 1).toString(),
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          c.records[i].code!,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          c.records[i].country!.name ?? "-",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          c.records[i].date?.split("T")[0] ??
                                              "-",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          c.records[i].cost?.toString() ?? "-",
                                          // c.records[i].date?.split("T")[0] ?? "-",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          c.records[i].deliveryCost
                                                  ?.toString() ??
                                              "-",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          c.records[i].payForClient
                                                  ?.toString() ??
                                              "-",
                                          // c.records[i].deliveryCost?.toString() ?? "-",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          c.records[i].oldCost?.toString() ??
                                              "-",
                                          // c.records[i].payForClient?.toString() ?? "-",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 1),
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  // width: widthTow,
                                  width: widthTow * 1.5,
                                  color: Colors.black,
                                  child: Container(
                                      color: Colors.white,
                                      alignment: Alignment.center,
                                      child: Column(children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          c.records[i].clientNote ?? "-",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ])),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 1),
                                    padding: EdgeInsets.all(1),
                                    height: 30,
                                    // width: widthTow,
                                    // width: widthTow * 1.5,
                                    color: Colors.black,
                                    child: Container(
                                        color: Colors.white,
                                        alignment: Alignment.center,
                                        child: Column(children: [
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            c.records[i].note ?? "-",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ),
                                        ])),
                                  ),
                                )
                              ]);
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
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        c.records.length.toString(),
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
                          color: Colors.grey[100],
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
                          color: Colors.grey[100],
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
                      // height: 20,
                      // width: widthTow * 1.22,

                      // margin: EdgeInsets.only(left: 138),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        NumberFormat('###,###')
                            .format(
                              c.records
                                  .map((element) => element.cost)
                                  .toList()
                                  .reduce((a, b) => a! + b!)!
                                  .toDouble(),
                            )
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
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        NumberFormat('###,###').format(c.records
                            .map((element) => element.deliveryCost)
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
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Text(
                        NumberFormat('###,###').format(c.records
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
                  () => c.documents.isNotEmpty
                      ? Column(
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
                                              c.documents[i].id?.toString() ??
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
                                              c.documents[i].date
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
                                              c.documents[i].isPay!
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
                                              c.documents[i].amount
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
                                              c.documents[i].about.toString(),
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
                                              c.documents[i].note?.toString() ??
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
                                  itemCount: Get.find<AccountStatements>()
                                      .documents
                                      .length,
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
                                        .format(c.documents
                                            .map((element) => element.amount)
                                            .toList()
                                            .reduce((a, b) =>
                                                a! +
                                                b!)! //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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
                                    NumberFormat('###,###').format(c.records
                                            .map((element) =>
                                                element.payForClient)
                                            .toList()
                                            .reduce((a, b) => a! + b!)!
                                            .toDouble() +
                                        c.documents
                                            .map((element) => element.amount)
                                            .toList()
                                            .reduce((a, b) => a! + b!)!
                                            .toDouble()),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    c.dispose();
  }
}
