import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Payment-Order/controller.dart';
import 'package:quqaz/Payment-Order/model.dart';

class PaymentOrder extends GetView<PaymentController> {
  //
  //
  // TextEditingController? notes = TextEditingController();
  //
  // PaymentOrderModel? t3;
  //
  // final _controller = ScrollController();
  //
  // var _key = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    //
    controller.getPayments();
    //
    controller.getCPaymentRequests();
    print("rebuild");
    //
    double _w = MediaQuery.of(context).size.width;
    //
    return Container(
      color: Color(0xFF505050),
      padding: EdgeInsets.all(12),
      height: Get.height,
      child: SingleChildScrollView(
        // controller: _controller,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              color: Colors.white,
              alignment: Alignment.centerRight,
              child: Form(
                key: controller.key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Obx(
                      () => Column(
                        children: [
                          DropdownButtonFormField<PaymentOrderModel>(
                            validator: (value) =>
                                value == null ? 'ادخل طريقة الدفع' : null,
                            onSaved: (v) {
                              controller.myForm.value.paymentWayId = v!.id;
                            },
                            onChanged: (val) {
                              controller.t3 = val!;
                              // print(val.name);
                            },
                            value: controller.t3,
                            // value: Template(canDelete: false, id: 1, name: "Obada"),
                            // value: Template(name: "dddd", canDelete: false, id: 1),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            isExpanded: true,
                            isDense: false,
                            items: controller.payments.isNotEmpty
                                ? controller.payments
                                    .map(
                                      (element) =>
                                          DropdownMenuItem<PaymentOrderModel>(
                                        child: Text(element.name ?? ""),
                                        value: element,
                                      ),
                                    )
                                    .toList()
                                : null,
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: controller.notes,
                            onSaved: (s) {
                              controller.myForm.value.note = s;
                            },
                            validator: (h) =>
                                h!.isEmpty ? "ادخل ملاحظات" : null,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText: "ملاحظات",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (controller.key.currentState!.validate()) {
                          controller.key.currentState!.save();
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
                          var t = await controller.postPayemntsOrder();
                          Get.back();
                          if (t) {
                            Get.defaultDialog(
                              title: "تم",
                              titlePadding: EdgeInsets.all(0),
                              content: Text(
                                "تمت الإضافة بنجاح",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            );
                            controller.getCPaymentRequests();
                          } else {
                            Get.defaultDialog(
                              title: "خطأ",
                              titlePadding: EdgeInsets.all(0),
                              content: Text(
                                "لم تتم الإضافة ",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: Center(
                        child: Text(
                          "إضافة",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.cPaymentRequests.value.dto != null &&
                          controller.cPaymentRequests.value.dto!.isNotEmpty
                      ? Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              //
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                reverse: true,
                                child: DataTable(
                                  columnSpacing: 38.0,
                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        '',
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'ملاحظات',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text('التاريخ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    DataColumn(
                                      label: Text('الحالة',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    DataColumn(
                                      label: Text('طريقة الدفع',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    DataColumn(
                                      label: Text('الرقم',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                  rows: controller.cPaymentRequests.value.dto!
                                      .map((e) => DataRow(cells: [
                                            DataCell(
                                              Container(
                                                child: IconButton(
                                                    onPressed: () async {
                                                      Get.defaultDialog(
                                                        title: "",
                                                        titlePadding:
                                                            EdgeInsets.all(0),
                                                        content: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
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
                                                      var r = await ApiService
                                                          .deletePaymentsOrder(
                                                              e.id!);
                                                      Get.back();
                                                      if (r) {
                                                        Get.defaultDialog(
                                                          title: "تم",
                                                          // titlePadding:
                                                          //     EdgeInsets.all(5),
                                                          content: Text(
                                                            "تم حذف طلب الحساب بنجاح",
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        );
                                                        await Future.delayed(
                                                            Duration(
                                                                seconds: 1));
                                                        Get.back();
                                                        controller
                                                            .getCPaymentRequests();
                                                      } else {
                                                        Get.defaultDialog(
                                                          title: "خطأ",
                                                          // titlePadding:
                                                          //     EdgeInsets.all(5),
                                                          content: Text(
                                                            "لم يتم حذف الإعلان بنجاح",
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    icon: Icon(Icons.delete)),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
                                                child: Text(e.note!),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
                                                child: Text(e.createDate!
                                                    .split("T")[0]),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
                                                child: Text(
                                                  e.accept == null
                                                      ? "قيد المعالجة"
                                                      : e.accept == false
                                                          ? "مرفوض"
                                                          : "مقبول",
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
                                                child: Text(e.paymentWay!.name
                                                    .toString()),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
                                                child: Text(e.id.toString()),
                                              ),
                                            ),
                                          ]))
                                      .toList(),
                                ),
                              )
                              // Container(
                              //   padding: EdgeInsets.all(15),
                              //   width: Get.width,
                              //   // padding: EdgeInsets.only(right: 20),
                              //   color: Colors.blue[50],
                              //   // height: 50,
                              //   child: SingleChildScrollView(
                              //     scrollDirection: Axis.horizontal,
                              //     child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.end,
                              //       children: <Widget>[
                              //         Text(
                              //           "ملاحظات",
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ),
                              //         SizedBox(width: 10),
                              //         Text(
                              //           "التاريخ",
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ),
                              //         SizedBox(width: 10),
                              //         Text(
                              //           "الحالة",
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ),
                              //         SizedBox(width: 10),
                              //         Text(
                              //           "طريقة الدفع",
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ),
                              //         SizedBox(width: 10),
                              //         Text(
                              //           "الرقم",
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              // Table(
                              //   textDirection: TextDirection.ltr,
                              //   border: TableBorder.all(
                              //     color: Colors.black,
                              //     style: BorderStyle.solid,
                              //     borderRadius:
                              //         BorderRadius.all(Radius.circular(25)),
                              //     width: 0,
                              //   ),
                              //   children: [
                              //     TableRow(
                              //       children: [
                              //         Text(
                              //           "ملاحظات",
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ).paddingAll(10),
                              //         Text(
                              //           "التاريخ",
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ).paddingAll(10),
                              //         Text(
                              //           "الحالة",
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ).paddingAll(10),
                              //         Text(
                              //           "طريقة الدفع",
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ).paddingAll(10),
                              //         Text(
                              //           "الرقم",
                              //           textAlign: TextAlign.right,
                              //           style: TextStyle(
                              //             color: Colors.black,
                              //             fontSize: 15,
                              //           ),
                              //         ).paddingAll(10),
                              //       ],
                              //     ),
                              //     controller.cPaymentRequests.value.dto!
                              //         .map(
                              //           (data) => TableRow(
                              //             children: [
                              //               Column(
                              //                   children: [Text('Javatpoint')]),
                              //               Column(children: [Text('Flutter')]),
                              //               Column(children: [Text('5*')]),
                              //             ],
                              //           ),
                              //         )
                              //         .toList()
                              //     // TableRow(
                              //   children: [
                              //     Column(children: [Text('Javatpoint')]),
                              //     Column(children: [Text('Flutter')]),
                              //     Column(children: [Text('5*')]),
                              //   ],
                              // ),
                              // TableRow(
                              //   children: [
                              //     Column(children: [Text('Javatpoint')]),
                              //     Column(children: [Text('MySQL')]),
                              //     Column(children: [Text('5*')]),
                              //   ],
                              // ),
                              // TableRow(
                              //   children: [
                              //     Column(children: [Text('Javatpoint')]),
                              //     Column(children: [Text('ReactJS')]),
                              //     Column(children: [Text('5*')]),
                              //     Column(children: [Text('ReactJS')]),
                              //     Column(children: [Text('5*')]),
                              //   ],
                              // )
                              //   ],
                              // ),
                              // ListView.separated(
                              //   shrinkWrap: true,
                              //   itemBuilder: (x, i) {
                              //     return Container(
                              //       color: i == 0
                              //           ? Colors.pink[50]
                              //           : Colors.grey[100],
                              //       // height: 50,
                              //       padding: EdgeInsets.all(15),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: <Widget>[
                              //           Text(
                              //             controller.cPaymentRequests.value
                              //                 .dto![i].note!,
                              //             style: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: 15),
                              //           ),
                              //           Text(
                              //             controller.cPaymentRequests.value
                              //                 .dto![i].createDate!
                              //                 .split("T")[0],
                              //             style: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: 15),
                              //           ),
                              //           Text(
                              //             controller.cPaymentRequests.value
                              //                         .dto![i].accept ==
                              //                     null
                              //                 ? "قيد المعالجة"
                              //                 : controller
                              //                             .cPaymentRequests
                              //                             .value
                              //                             .dto![i]
                              //                             .accept ==
                              //                         false
                              //                     ? "مرفوض"
                              //                     : "مقبول",
                              //             style: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: 15),
                              //           ),
                              //           Text(
                              //             controller.cPaymentRequests.value
                              //                 .dto![i].paymentWay!.name!,
                              //             style: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: 15),
                              //           ),
                              //           Text(
                              //             controller
                              //                 .cPaymentRequests.value.dto![i].id
                              //                 .toString(),
                              //             style: TextStyle(
                              //                 color: Colors.black,
                              //                 fontSize: 15),
                              //           ),
                              //         ],
                              //       ),
                              //     );
                              //   },
                              //   separatorBuilder: (x, n) {
                              //     return SizedBox(height: 5);
                              //   },
                              //   itemCount: controller
                              //       .cPaymentRequests.value.dto!.length,
                              // )
                            ],
                          ),
                        )
                      : Text("لايوجد طلبات"),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await controller.getCPaymentRequests(
                          page: 1,
                        );
                        // _controller.animateTo(
                        //   _controller.position.maxScrollExtent + 700,
                        //   duration: Duration(milliseconds: 800),
                        //   curve: Curves.ease,
                        // );
                        controller.index.value = 1;
                      },
                      child: Text("الأول")),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.getCPaymentRequests(
                        page: controller.index.value == 1
                            ? 1
                            : --controller.index.value,
                      );
                      // _controller.animateTo(
                      //   _controller.position.maxScrollExtent + 700,
                      //   duration: Duration(milliseconds: 800),
                      //   curve: Curves.ease,
                      // );
                    },
                    child: Text("السابق"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.getCPaymentRequests(
                        page: controller.index.value ==
                                controller.resultIndex.value
                            ? controller.index.value
                            : ++controller.index.value,
                      );
                      // _controller.animateTo(
                      //   _controller.position.maxScrollExtent + 700,
                      //   duration: Duration(milliseconds: 800),
                      //   curve: Curves.ease,
                      // );
                    },
                    child: Text("التالي"),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await controller.getCPaymentRequests(
                          page: controller.resultIndex.value,
                        );
                        controller.index.value = controller.resultIndex.value;
                        // _controller.animateTo(
                        //   _controller.position.maxScrollExtent + 700,
                        //   duration: Duration(milliseconds: 800),
                        //   curve: Curves.ease,
                        // );
                      },
                      child: Text("الأخير")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
