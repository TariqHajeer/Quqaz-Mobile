import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:quqaz/API/ApiService.dart';

// import 'package:pdf/widgets.dart';
import 'package:quqaz/SendOrderToClient/controller.dart';

class SendOrders extends StatelessWidget {
  //
  void _showError() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text("خطأ"),
          content: Container(
            child: Center(child: Text("رقم الوصل غير فعال")),
          ),
        );
      },
    );
  }

  //
  void _showEmpty() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "خطأ",
            textAlign: TextAlign.right,
          ),
          content: Text(
            "قم بإضافة نوع الطلبية",
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }

  var c = Get.put(SendOrderController());
  //
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    c.getSendOrders();
    return Container(
      color: Color(0xFF505050),
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: Colors.white, 
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetX<SendOrderController>(
                builder: (x) {
                  return x.isLoading1.value
                      ? CircularProgressIndicator()
                      : x.sendOrders.isEmpty
                          ? Text("لايوجد طلبات")
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: c.sendOrders.length,
                                  itemBuilder: (context, index) {
                                    return AnimationConfiguration.staggeredGrid(
                                      position: 0,
                                      duration: Duration(milliseconds: 500),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        duration: Duration(milliseconds: 900),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        child: FadeInAnimation(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              bottom: _w / 250,
                                              left: _w / 250,
                                              right: _w / 50,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFF63c2de),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 40,
                                                  spreadRadius: 10,
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: SizedBox(
                                                          child: IconButton(
                                                            onPressed:
                                                                () async {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'تأكيد حذف الطلب'),
                                                                    content: Text(
                                                                        "هل انت متأكد من حذف الطلب ؟"),
                                                                    actions: <
                                                                        Widget>[
                                                                      ElevatedButton(
                                                                        child: Text(
                                                                            "نعم"),
                                                                        onPressed:
                                                                            () async {
                                                                          Get.back();
                                                                          Get.defaultDialog(
                                                                            title:
                                                                                "",
                                                                            titlePadding:
                                                                                EdgeInsets.all(0),
                                                                            content:
                                                                                Row(
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
                                                                          var t = await ApiService.deleteSendOrder(c
                                                                              .sendOrders[index]
                                                                              .id!);
                                                                          Get.back();
                                                                          if (t) {
                                                                            AwesomeDialog(
                                                                              context: Get.context!,
                                                                              animType: AnimType.SCALE,
                                                                              dialogType: DialogType.SUCCES,
                                                                              body: Text(
                                                                                'تم حذف الطلب بنجاح',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 20),
                                                                              ),
                                                                              title: 'This is Ignored',
                                                                              desc: 'This is also Ignored',
                                                                              btnOkOnPress: () {},
                                                                            )..show();
                                                                          } else {
                                                                            AwesomeDialog(
                                                                              btnOkColor: Colors.red,
                                                                              context: Get.context!,
                                                                              animType: AnimType.SCALE,
                                                                              dialogType: DialogType.ERROR,
                                                                              body: Text(
                                                                                'تأكد من الاتصال من الانترنت وحاول مجدداً',
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 17),
                                                                              ),
                                                                              title: 'This is Ignored',
                                                                              desc: 'This is also Ignored',
                                                                              btnOkOnPress: () {},
                                                                            )..show();
                                                                          }
                                                                          c.getSendOrders();
                                                                        },
                                                                      ),
                                                                      ElevatedButton(
                                                                        child: Text(
                                                                            "لا"),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                      // ElevatedButton(
                                                                      //   child: Text("CANCEL"),
                                                                      //   onPressed: () {
                                                                      //     //Put your code here which you want to execute on Cancel button click.
                                                                      //     Navigator.of(context).pop();
                                                                      //   },
                                                                      // ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color:
                                                                  Colors.white,
                                                              size: 25,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .dropbox,
                                                        color: Colors.white,
                                                        size: 35,
                                                      ),
                                                      SizedBox(width: 8),
                                                      Text(
                                                        "${c.sendOrders[index].code}",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Expanded(
                                                          child: SizedBox()),
                                                      // SizedBox(width: 15),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.person,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        c.sendOrders[index]
                                                            .recipientName!,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),

                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Icon(
                                                        Icons.call,
                                                        color: Colors.white,
                                                      ),
                                                      Text(
                                                        c.sendOrders[index]
                                                            .recipientPhones!,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  SizedBox(height: 20),

                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .moneyBill,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      Text(
                                                        c.sendOrders[index].cost
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      Text(
                                                        c.sendOrders[index]
                                                                .address
                                                                .toString() +
                                                            "  -  ",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      Text(
                                                        c.sendOrders[index]
                                                            .country!.name!,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  // Row(
                                                  //   mainAxisAlignment:
                                                  //       MainAxisAlignment.center,
                                                  //   children: [
                                                  //     Text(
                                                  //       controller
                                                  //           .cOrders
                                                  //           .value
                                                  //           .data![index]
                                                  //           .country!
                                                  //           .name!,
                                                  //       style: TextStyle(
                                                  //         color: Colors.white,
                                                  //         fontSize: 16,
                                                  //       ),
                                                  //     ),
                                                  //     Icon(
                                                  //       Icons.location_on,
                                                  //       color: Colors.white,
                                                  //     )
                                                  //   ],
                                                  // ),
                                                  // SizedBox(height: 10),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      height: 15,
                                    );
                                  },
                                ),
                                SizedBox(height: 25),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (c.sendOrders.length <= 2) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              'تأكيد',
                                              textAlign: TextAlign.right,
                                            ),
                                            content: Text(
                                              "إضافة كلفة 2000 دينار للمندوب",
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: Text("قبول"),
                                                onPressed: () async {
                                                  Get.back();
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

                                                  var r =
                                                      await c.postSendOrders();
                                                  Get.back();
                                                  if (r) {
                                                    AwesomeDialog(
                                                      context: Get.context!,
                                                      animType: AnimType.SCALE,
                                                      dialogType:
                                                          DialogType.SUCCES,
                                                      body: Text(
                                                        'تم إرسال الطلبات بنجاح',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      title: 'This is Ignored',
                                                      desc:
                                                          'This is also Ignored',
                                                      btnOkOnPress: () {},
                                                    )..show();
                                                  } else {
                                                    AwesomeDialog(
                                                      btnOkColor: Colors.red,
                                                      context: Get.context!,
                                                      animType: AnimType.SCALE,
                                                      dialogType:
                                                          DialogType.ERROR,
                                                      body: Text(
                                                        'تأكد من الاتصال من الانترنت وحاول مجدداً',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 17),
                                                      ),
                                                      title: 'This is Ignored',
                                                      desc:
                                                          'This is also Ignored',
                                                      btnOkOnPress: () {},
                                                    )..show();
                                                  }
                                                  c.getSendOrders();
                                                },
                                              ),
                                              ElevatedButton(
                                                child: Text("رفض"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              // ElevatedButton(
                                              //   child: Text("CANCEL"),
                                              //   onPressed: () {
                                              //     //Put your code here which you want to execute on Cancel button click.
                                              //     Navigator.of(context).pop();
                                              //   },
                                              // ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
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

                                      var r = await c.postSendOrders();
                                      Get.back();
                                      if (r) {
                                        AwesomeDialog(
                                          context: Get.context!,
                                          animType: AnimType.SCALE,
                                          dialogType: DialogType.SUCCES,
                                          body: Text(
                                            'تم إرسال الطلبات بنجاح',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          title: 'This is Ignored',
                                          desc: 'This is also Ignored',
                                          btnOkOnPress: () {},
                                        )..show();
                                      } else {
                                        AwesomeDialog(
                                          btnOkColor: Colors.red,
                                          context: Get.context!,
                                          animType: AnimType.SCALE,
                                          dialogType: DialogType.ERROR,
                                          body: Text(
                                            'تأكد من الاتصال من الانترنت وحاول مجدداً',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 17),
                                          ),
                                          title: 'This is Ignored',
                                          desc: 'This is also Ignored',
                                          btnOkOnPress: () {},
                                        )..show();
                                      }
                                      c.getSendOrders();
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Text(
                                      "إرسال",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
