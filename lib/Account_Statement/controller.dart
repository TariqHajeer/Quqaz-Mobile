import 'dart:developer';
import 'dart:io';

// import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Account_Statement/model.dart';
import 'package:quqaz/Account_Statement/view.dart';
import 'package:quqaz/User_Account/controller.dart';

//
class AccountStatements extends GetxController {
  //
  RxList<CheckB> checks = <CheckB>[].obs;

  //
  RxBool isLoading = false.obs;

  //
  RxList<Record> records = <Record>[].obs;

  //
  List<int?> orderPlacedId = <int?>[];

  //
  RxList<bool?> list = <bool>[].obs;

  //
  RxList<Documentss> documents = <Documentss>[].obs;

  //
  RxBool? isClientDeleviredMoney = false.obs;

  //
  RxBool? clientDoNotDeleviredMoney = false.obs;

  //
  Future getCheckBoxes() async {
    var result = await ApiService.getCheckBoxes();
    var result2 = await ApiService.getDocuments();
    if (result2 != null) documents.value = result2;
    if (result != null) {
      checks.value = result;
      list.value = checks.map((element) => false).toList();
      orderPlacedId = checks.map((element) => 0).toList();
      //TODO remove todo
      checks.removeWhere((e) => e.id == 1 || e.id == 2 || e.id == 8);
      print(result);
    }
  }

  //
  Future getRecords() async {
    //
    records = <Record>[].obs;
    //
    isLoading.value = true;
    //
    var result = await ApiService.getRecords(
      orderPlacedId,
      isClientDeleviredMoney!.value,
      clientDoNotDeleviredMoney!.value,
    );
    //
    isLoading.value = false;
    //
    if (result != null) {
      print("here the respones");
      inspect(result);
      records.value = result;
      update();
    }
  }

  //
  //

  Future<void> generateAndPrintArabicPdf() async {
    print(Get.width);
    var widths = 432 / 3;
    var widthTow = 355 / 10;
    var c = Get.find<AccountStatements>();
    final Document pdf = Document();
    var assetImage = MemoryImage(
      (await rootBundle.load('images/quqaz.jpeg')).buffer.asUint8List(),
    );
    var arabicFont = Font.ttf(await rootBundle.load("fonts/HacenTunisia.ttf"));
    // var totalDocumentsAmount = c.documents
    //     .map((element) => element.amount!)
    //     .toList()
    //     .reduce((a, b) => a + b)
    //     .toDouble();

    double totalDocumentsAmount = 0;
    for (int i = 0; i < c.documents.length; i++)
      totalDocumentsAmount += c.documents[i].amount!;

    // var finalAmount = c.records
    //                     .map((element) => element.payForClient)
    //                     .toList()
    //                     .reduce((a, b) => a! + b!)!
    //                     .toDouble() +
    //                 c.documents
    //                     .map((element) => element.amount)
    //                     .toList()
    //                     .reduce((a, b) => a! + b!)!
    //                     .toDouble();

    double finalAmount = 0;
    for (int i = 0; i < c.records.length; i++)
      finalAmount += c.records[i].payForClient!;
    finalAmount += totalDocumentsAmount;

    // NumberFormat('###,###')
    //     .format(c.documents
    //         .map((element) => element.amount!)
    //         .toList()
    //         .reduce((a, b) => a + b)
    //         .toDouble())
    //     .toString());
    print('totalDocumentsAmount $totalDocumentsAmount');
    print('finalAmount $finalAmount');
    pdf.addPage(Page(
        theme: ThemeData.withFont(
          base: arabicFont,
          icons: await PdfGoogleFonts.materialIcons(),
        ),
        pageFormat: PdfPageFormat.standard,
        margin: EdgeInsets.all(0),
        build: (Context context) {
          return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                // scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: widths,
                          margin: EdgeInsets.only(right: 45),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "كشف حساب",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                Get.find<GetByTokenController>()
                                        .getByToken
                                        .value
                                        .name ??
                                    "-",
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(
                                height: 3,
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
                                child: Image(assetImage),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 25),
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
                                    color: PdfColor.fromInt(0xff000000),
                                    child: Container(
                                      color: PdfColor.fromInt(0xFFFFFFFF),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "مستخدم الطابعة",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: PdfColor.fromInt(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(1),
                                    height: 25,
                                    width: 55,
                                    color: PdfColor.fromInt(0xff000000),
                                    child: Container(
                                      color: PdfColor.fromInt(0xFFFFFFFF),
                                      alignment: Alignment.center,
                                      child: Text(
                                        Get.find<GetByTokenController>()
                                                .getByToken
                                                .value
                                                .name ??
                                            "",
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: PdfColor.fromInt(0xff000000),
                                        ),
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
                                    color: PdfColor.fromInt(0xff000000),
                                    child: Container(
                                      color: PdfColor.fromInt(0xFFFFFFFF),
                                      alignment: Alignment.center,
                                      child: Text(
                                        " تاريخ الطباعة",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: PdfColor.fromInt(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(1),
                                    height: 25,
                                    width: 55,
                                    color: PdfColor.fromInt(0xff000000),
                                    child: Container(
                                      color: PdfColor.fromInt(0xFFFFFFFF),
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.only(right: 1, left: 1),
                                      child: Text(
                                        DateTime.now().toString().split(" ")[0],
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: PdfColor.fromInt(0xff000000),
                                        ),
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
                                    color: PdfColor.fromInt(0xff000000),
                                    child: Container(
                                      color: PdfColor.fromInt(0xFFFFFFFF),
                                      alignment: Alignment.center,
                                      child: Text(
                                        " تاريخ الطباعة",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: PdfColor.fromInt(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(1),
                                    height: 25,
                                    width: 55,
                                    color: PdfColor.fromInt(0xff000000),
                                    child: Container(
                                      color: PdfColor.fromInt(0xFFFFFFFF),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(right: 3),
                                      child: Text(
                                        DateFormat("h:mma")
                                            .format(
                                              DateTime.now(),
                                            )
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: PdfColor.fromInt(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(right: 2)),
                        Text(
                          "اربيل",
                          style: TextStyle(),
                        ),
                        Padding(padding: EdgeInsets.only(right: 2)),
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
                          width: widthTow * 3,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              "ملاحظات",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.7,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              "ملاحظات العميل",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.5,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              " المبلغ القديم",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.5,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              "يدفع للعميل",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.1,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              "الرسوم",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.2,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              "الاجمالي",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.5,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              "تاريخ الطلب",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.2,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              "المحافظة",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.5,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF858585),
                            alignment: Alignment.center,
                            child: Text(
                              "رقم الوصل",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow,
                          color: PdfColor.fromInt(0xff000000),
                          child: Container(
                            color: PdfColor.fromInt(0xFF808080),
                            alignment: Alignment.center,
                            child: Text(
                              "ترقيم",
                              style: TextStyle(
                                fontSize: 11,
                                color: PdfColor.fromInt(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    // // ! Hereee
                    Container(
                      width: 668,
                      // height: Get.height,
                      child: ListView.separated(
                        // physics: NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        itemCount: Get.find<AccountStatements>().records.length,
                        separatorBuilder: (Context context, int index) {
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
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    i.toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.5,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].code!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.2,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].country!.name ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.5,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].date?.split("T")[0] ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.2,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].cost?.toString() ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.1,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].deliveryCost?.toString() ??
                                        "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.5,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].payForClient?.toString() ??
                                        "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.5,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].oldCost?.toString() ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.7,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].clientNote ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 3,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.records[i].note ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ].reversed.toList(),
                          );
                        },
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
                            color: PdfColor.fromInt(0xFF8D8D8D),
                            border: Border.all(
                              color: PdfColor.fromInt(0xff000000),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Container(
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.5,
                          decoration: BoxDecoration(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              border: Border.all(
                                  color: PdfColor.fromInt(0xFF000000),
                                  width: 1)),
                          child: Text(
                            " العدد",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Container(
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 2.72,
                          decoration: BoxDecoration(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              border: Border.all(
                                  color: PdfColor.fromInt(0xff000000),
                                  width: 1)),
                          child: Text(
                            "اجمالي كلفة الطلبات",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff000000),
                            ),
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
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              border: Border.all(
                                  color: PdfColor.fromInt(0xff000000),
                                  width: 1)),
                          child: Text(
                            NumberFormat('###,###')
                                .format(c.records
                                    .map((element) => element.cost)
                                    .toList()
                                    .reduce((a, b) => a! + b!)!
                                    .toDouble())
                                .toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff000000),
                            ),
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
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              border: Border.all(
                                  color: PdfColor.fromInt(0xff000000),
                                  width: 1)),
                          child: Text(
                            NumberFormat('###,###').format(c.records
                                .map((element) => element.deliveryCost)
                                .toList()
                                .reduce((a, b) => a! + b!)!
                                .toDouble()),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff000000),
                            ),
                          ),
                        ),
                        SizedBox(width: 1),
                        Container(
                          // margin: EdgeInsets.only(right: 1),
                          padding: EdgeInsets.all(1),
                          height: 20,
                          width: widthTow * 1.48,

                          margin: EdgeInsets.only(left: 222),
                          decoration: BoxDecoration(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              border: Border.all(
                                  color: PdfColor.fromInt(0xff000000),
                                  width: 1)),
                          child: Text(
                            NumberFormat('###,###').format(c.records
                                .map((element) => element.payForClient)
                                .toList()
                                .reduce((a, b) => a! + b!)!
                                .toDouble()),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              color: PdfColor.fromInt(0xff000000),
                            ),
                          ),
                        ),
                      ].reversed.toList(),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      width: 575,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 6),
                      color: PdfColor.fromInt(0xFF6FA2FF),
                      child: Text(
                        "السندات",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: PdfColor.fromInt(0xff000000),
                        ),
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
                            color: PdfColor.fromInt(0xff000000),
                            child: Container(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              alignment: Alignment.center,
                              child: Text(
                                "ترقيم",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 1),
                            padding: EdgeInsets.all(1),
                            height: 20,
                            width: widthTow * 1.5,
                            color: PdfColor.fromInt(0xff000000),
                            child: Container(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              alignment: Alignment.center,
                              child: Text(
                                "رقم السند",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 1),
                            padding: EdgeInsets.all(1),
                            height: 20,
                            width: widthTow * 2,
                            color: PdfColor.fromInt(0xff000000),
                            child: Container(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              alignment: Alignment.center,
                              child: Text(
                                "التاريخ",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 1),
                            padding: EdgeInsets.all(1),
                            height: 20,
                            width: widthTow * 2.28,
                            color: PdfColor.fromInt(0xff000000),
                            child: Container(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              alignment: Alignment.center,
                              child: Text(
                                " حالة السند",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 1),
                            padding: EdgeInsets.all(1),
                            height: 20,
                            width: widthTow * 2.5,
                            color: PdfColor.fromInt(0xff000000),
                            child: Container(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              alignment: Alignment.center,
                              child: Text(
                                "كلفة السند",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 1),
                            padding: EdgeInsets.all(1),
                            height: 20,
                            width: widthTow * 2,
                            color: PdfColor.fromInt(0xff000000),
                            child: Container(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              alignment: Alignment.center,
                              child: Text(
                                "وذلك عن",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 1),
                            padding: EdgeInsets.all(1),
                            height: 20,
                            width: widthTow * 4,
                            color: PdfColor.fromInt(0xff000000),
                            child: Container(
                              color: PdfColor.fromInt(0xFF8D8D8D),
                              alignment: Alignment.center,
                              child: Text(
                                "ملاحظات",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ].reversed.toList(),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: 668,
                      child: ListView.separated(
                        itemBuilder: (x, i) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    i.toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 1.5,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.documents[i].id?.toString() ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 2,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.documents[i].date?.split("T")[0] ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 2.28,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.documents[i].isPay! ? "صرف" : "قبض",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 2.5,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.documents[i].amount?.toString() ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 2,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.documents[i].about.toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 1),
                                padding: EdgeInsets.all(1),
                                height: 20,
                                width: widthTow * 4,
                                color: PdfColor.fromInt(0xff000000),
                                child: Container(
                                  color: PdfColor.fromInt(0xFFFFFFFF),
                                  alignment: Alignment.center,
                                  child: Text(
                                    c.documents[i].note?.toString() ?? "-",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: PdfColor.fromInt(0xff000000),
                                    ),
                                  ),
                                ),
                              ),
                            ].reversed.toList(),
                          );
                        },
                        // shrinkWrap: true,
                        itemCount:
                            Get.find<AccountStatements>().documents.length,
                        separatorBuilder: (Context context, int index) {
                          return SizedBox(height: 1);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 114),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 6.2,
                              decoration: BoxDecoration(
                                  color: PdfColor.fromInt(0xFF8D8D8D),
                                  border: Border.all(
                                      color: PdfColor.fromInt(0xff000000),
                                      width: 1)),
                              child: Text(
                                "اجمالي كلفة السندات",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            Container(
                              // margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 6,

                              decoration: BoxDecoration(
                                  color: PdfColor.fromInt(0xFF8D8D8D),
                                  border: Border.all(
                                      color: PdfColor.fromInt(0xff000000),
                                      width: 1)),
                              child: Text(
                                totalDocumentsAmount.toString(),
                                // NumberFormat('###,###').format(c.records
                                //     .map((element) => element.payForClient)
                                //     .toList()
                                //     .reduce((a, b) => a! + b!)!
                                //     .toDouble())
                                // NumberFormat('###,###')
                                //     .format(c.documents
                                //         .map((element) => element.amount!)
                                //         .toList()
                                //         .reduce((a, b) => a + b)
                                //         .toDouble())
                                //     .toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                          ].reversed.toList(),
                        )),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 114),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 6.2,
                              decoration: BoxDecoration(
                                  color: PdfColor.fromInt(0xFF8D8D8D),
                                  border: Border.all(
                                      color: PdfColor.fromInt(0xff000000),
                                      width: 1)),
                              child: Text(
                                "المبلغ النهائي",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                ),
                              ),
                            ),
                            SizedBox(width: 2),
                            Container(
                              // margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.all(1),
                              height: 20,
                              width: widthTow * 6,

                              decoration: BoxDecoration(
                                  color: PdfColor.fromInt(0xFF8D8D8D),
                                  border: Border.all(
                                      color: PdfColor.fromInt(0xff000000),
                                      width: 1)),
                              child: Text(
                                  finalAmount.toString(),
                                // NumberFormat('###,###').format(c.records
                                //         .map((element) => element.payForClient)
                                //         .toList()
                                //         .reduce((a, b) => a! + b!)!
                                //         .toDouble() +
                                //     c.documents
                                //         .map((element) => element.amount)
                                //         .toList()
                                //         .reduce((a, b) => a! + b!)!
                                //         .toDouble()),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: PdfColor.fromInt(0xff000000),
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ));
        }));
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/${DateTime.now().toString()}.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
