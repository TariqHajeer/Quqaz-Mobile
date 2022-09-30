import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Add-Order/model.dart';
import 'package:quqaz/Login/controller.dart';
import 'package:quqaz/Orders/model.dart';
import 'package:quqaz/Show-Order/model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

// import 'package:quqaz/Show-Order/model.dart';
class GetCOrder extends GetxController {
  //
  RxInt index = 1.obs;
  //
  RxInt resultIndex = 0.obs;
  //
  RxList<Countries> countries = <Countries>[].obs;
  //
  RxList<Regions> regions = <Regions>[].obs;
  //
  RxList<Template> orderPlaced = <Template>[].obs;
  //
  RxList<Template> moneyPlaced = <Template>[].obs;
  //
  Rx<COrder> cOrders = COrder().obs;
  //
  RxBool isLoading = false.obs;
  //
  Rx<COrderDModel> cOrder = COrderDModel().obs;
  //
  Rx<MyForm> myForm = MyForm().obs;
  @override
  void onReady() {
    super.onReady();
    print("Here On Ready");
    getCountries();
    getMoneyPlaced();
    getOrderPlaced();
    getRegions();
    getCOrder();
  }

  //
  Future getCOrderDetails(int id) async {
    var result = await ApiService.getCOrderDetails(id);
    if (result != null) {
      cOrder.value = result;
      myForm.value.orderItem = <OrderItem>[].obs;
      // inspect(result.orderItems!);
      // var temp = COrderDModel();
      myForm.value.orderItem!.value = (result.orderItems == null
          ? result.orderItems!.map((e) => e.orderTpye!).toList()
          : <OrderItem>[].obs);
    }
  }

  //
  Future getCOrder({
    int? page,
    int? code,
    int? phone,
    int? countryId,
    int? regionId,
    String? recipientName,
    int? monePlacedId,
    int? orderplacedId,
  }) async {
    isLoading.value = true;
    var result = await ApiService.getCOrder(
      page,
      code,
      phone,
      countryId,
      regionId,
      recipientName,
      monePlacedId,
      orderplacedId,
    );
    isLoading.value = false;

    if (result != null) {
      inspect(result);
      cOrders.value = result;
      resultIndex.value = int.parse(cOrders.value.total.toString()) ~/ 6;
    }
  }

  //
  Future getCountries() async {
    var result = await ApiService.getCountries();
    if (result != null) {
      countries.value = result;
      countries.insert(0, Countries(name: "الكل"));
    }
  }

  //
  Future getOrderPlaced() async {
    var result = await ApiService.getOrderPlaced();
    if (result != null) {
      orderPlaced.value = result;
      orderPlaced.insert(0, Template(name: "الكل"));
    }
  }

  //
  Future getMoneyPlaced() async {
    var result = await ApiService.getMoenyPlaced();
    if (result != null) {
      moneyPlaced.value = result;
      moneyPlaced.insert(0, Template(name: "الكل"));
    }
  }

  //
  Future getRegions() async {
    var result = await ApiService.getRegions();

    print(result);
    if (result != null) {
      regions.value = result;
      regions.insert(0, Regions(name: "الكل"));
    }
  }

  //
  Future putOrder() async {
    isLoading.value = true;
    var result = await ApiService.putCOrder(myForm.value, cOrder.value.id!);
    if (result) {
      // await Get.delete<GetCOrder>();
      // Get.put(GetCOrder());
      update();
    }
    isLoading.value = false;
    return result;
  }
  //

  Future<void> generateAndPrintArabicPdf() async {
    final Document pdf = Document();
    // final image = MemoryImage(
    //   File('logo.png').readAsBytesSync(),
    // );
// final PdfImage assetImage = await pdfImageFromImageProvider(
//     pdf: pdf.document,
//     image:  AssetImage('assets/test.jpg'),
// );
    var assetImage = MemoryImage(
      (await rootBundle.load('images/print.jpg')).buffer.asUint8List(),
    );
    var arabicFont = Font.ttf(await rootBundle.load("fonts/HacenTunisia.ttf"));
    pdf.addPage(Page(
        theme: ThemeData.withFont(
          base: arabicFont,
        ),
        pageFormat: PdfPageFormat.standard,
        margin: EdgeInsets.all(0),
        build: (Context context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              // color: PdfColor.fromInt(0xff000000),
              decoration: BoxDecoration(
                  border: Border.all(color: PdfColor.fromInt(0xff000000))),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'توصيل إلى جميع المحافظات',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'التسوق من جميع المواقع العاملية',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'trendyol amazon Ali express',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'ALibaba.com\n VICTORIA\'S SECERET',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                          child: Image(assetImage, height: 100, width: 100)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              '07700890880\t مندوب استلام طلبات ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              '07714400880\t التبليغات ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'Goal الهدف ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'اربيل',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                      // PdfImage.file(pdf.document , bytes: assetImage.bytes
                      // ignore: deprecated_member_use
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(cOrder.value.code ?? ""),
                      SizedBox(width: 5),
                      Text("رقم الوصل :"),
                      SizedBox(width: 100),
                      Text(cOrder.value.date!.split("T")[0]),
                      SizedBox(width: 5),
                      Text("التاريخ"),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    "معلومات المرسل",
                    style: TextStyle(
                      fontBold: Font.courierBold(),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColor.fromInt(
                                  0xff000000,
                                ),
                              ),
                            ),
                            child: Text(cOrder.value.address ?? "null"),
                          ),
                          SizedBox(width: 5),
                          Text("العنوان"),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Container(
                          width: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PdfColor.fromInt(
                                0xff000000,
                              ),
                            ),
                          ),
                          child: Text(
                            cOrder.value.clientPrint == null
                                ? cOrder.value.clientPrint![0]
                                        .destinationName ??
                                    "--"
                                : "--",
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("الاسم التجاري"),
                      ]),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColor.fromInt(
                                  0xff000000,
                                ),
                              ),
                            ),
                            child: Text(cOrder.value.recipientPhones ?? "null"),
                          ),
                          SizedBox(width: 20),
                          Text("  الهاتف"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColor.fromInt(
                                    0xff000000,
                                  ),
                                ),
                              ),
                              child: Text(cOrder.value.cost.toString())),
                          SizedBox(width: 5),
                          Text("  المبلغ \nمع \nالتوصيل"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "معلومات المستلم",
                    style: TextStyle(
                      fontBold: Font.courierBold(),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColor.fromInt(
                                  0xff000000,
                                ),
                              ),
                            ),
                            child: Text(cOrder.value.country?.name ?? ""),
                          ),
                          SizedBox(width: 5),
                          Text(" العنوان"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColor.fromInt(
                                    0xff000000,
                                  ),
                                ),
                              ),
                              child:
                                  Text(cOrder.value.recipientName ?? "null")),
                          SizedBox(width: 5),
                          Text("   الاسم"),
                        ],
                      )
                    ],
                  ),

                  //
                  //
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColor.fromInt(
                                  0xff000000,
                                ),
                              ),
                            ),
                            child: Text("11111")),
                        SizedBox(width: 5),
                        Text("هاتف 1"),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColor.fromInt(
                                  0xff000000,
                                ),
                              ),
                            ),
                            child: Text("22222"),
                          ),
                          SizedBox(width: 5),
                          Text("1 هاتف"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColor.fromInt(
                                    0xff000000,
                                  ),
                                ),
                              ),
                              child: Text("21")),
                          SizedBox(width: 5),
                          Text("نوع البضاعة 1"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColor.fromInt(
                                  0xff000000,
                                ),
                              ),
                            ),
                            child: Text("5"),
                          ),
                          SizedBox(width: 5),
                          Text("   العدد"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 500,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColor.fromInt(
                                  0xff000000,
                                ),
                              ),
                            ),
                            child: Text("22222"),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "\nمعلومات \nوملاحظات \nالمندوب",
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        "تنويه : شركة القوقز غير مسؤولة عن محتوى الطلب ونوعه"),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "ملاحظة : المبلغ المكتوب في الوصل كامل مع التوصيل ونحن غير مسؤولين عن أي مبلغ إضافي آخر يعطي للمندوب")),
                ],
              ),
            ),
          );
        }));
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/1.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
