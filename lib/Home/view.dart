import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quqaz/Account_Statement/view.dart';
import 'package:quqaz/Add-Order/view.dart';
import 'package:quqaz/Home/drawer.dart';
import 'package:quqaz/Home/notifications.dart';
import 'package:quqaz/MyPoints/view.dart';
import 'package:quqaz/Orders/view.dart';
import 'package:quqaz/Payment-Order/view.dart';
import 'package:quqaz/SendOrderToClient/view.dart';
import 'package:quqaz/Statements/view.dart';
import 'package:quqaz/User_Account/view.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:quqaz/controller/appController.dart';
import 'package:quqaz/notification/notification.dart';

import 'controller.dart';

class Home extends GetView<HomeController> {
  AppController appController = Get.find();
  //
  List<Widget> list = <Widget>[
    Account(),
    GridView1(),
    AddOrder(),
    Orders(),
    SendOrders(),
    StatementsByType(),
    PaymentOrder(),
    Statements(),
    MyPoint()
  ].obs;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          shadowColor: Colors.grey,
          backgroundColor: Color(0xFF2F353A),
          actions: [
            Stack(children: [
              IconButton(
                onPressed: () {
                  Get.to(Notifications());
                },
                icon: Icon(Icons.notifications),
              ),
              Obx(() {
                return (appController.lengthNoti != 0 &&
                        appController.lengthNoti != -1)
                    ? Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(appController.lengthNoti.toString())),
                        ),
                      )
                    : Container();
              })
            ])
          ],
        ),
        body: DoubleBackToCloseApp(
            snackBar: SnackBar(
                content: Text(
              "Tap back again to leave",
              textAlign: TextAlign.center,
            )),
            child: Obx(() => list[controller.index.value])));
  }
}

class GridView1 extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    return GetX<HomeController>(builder: (c) {
      return c.isLoadingHomeList.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () async {
                return await controller.getHome();
              },
              child: AnimationLimiter(
                child: GridView.count(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: EdgeInsets.all(_w / 60),
                  crossAxisCount: columnCount,
                  children: [
                    AnimationConfiguration.staggeredGrid(
                      position: 0,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFF63c2de),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.dropbox,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.totalOrder}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود الكلي",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 1,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFF20a8d8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.signOutAlt,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderMoneyInCompany}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود التي مبالغها داخل الشركة",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 2,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFFffc107),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.home,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderDeliverdToClient}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود تم تسليمها الى الزبون",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 3,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFF3b5998),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.moneyBill,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderMoneyDelived}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود تم استلام مبالغها",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 4,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFF63c2de),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.cubes,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderInStore}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود في المخزن",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 4,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFFf86c6b),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.car,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderInWat}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود في الطريق",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 4,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFF20a8d8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.hourglass,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderWithClient}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود في انتظار استلامها من الشركة",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 4,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFFffc107),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.signOutAlt,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderComplitlyReutrndInCompany}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود مرتجعة داخل الشركة",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 4,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFF3b5998),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.check,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderComplitlyReutrndDeliverd}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود المرتجعة تم تسليمها",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 4,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFF63c2de),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.chartPie,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.orderPartialReturned}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود المرتجعة جزئيا",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    AnimationConfiguration.staggeredGrid(
                      position: 4,
                      duration: Duration(milliseconds: 500),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: _w / 30, left: _w / 60, right: _w / 60),
                            decoration: BoxDecoration(
                              color: Color(0xFFf86c6b),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(2, 2))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Icon(
                                      FontAwesomeIcons.history,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                  Text(
                                    "${controller.homeList.value.delayedOrder}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "عدد الطرود المؤجلة",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
    }, initState: (state) {
      Get.find<HomeController>().getHome();
    });
  }
}
