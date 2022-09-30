import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quqaz/MyPoints/controller.dart';
// import 'package:pdf/widgets.dart';

class MyPoint extends GetView<MyPointController> {
  @override
  Widget build(BuildContext context) {
    controller.getMyPoint();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 10),
          child: Obx(() => controller.isLoading1.value
              ? CircularProgressIndicator()
              : ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "نقاطي",
                          style:
                              TextStyle(fontSize: 25, color: Colors.blue[800]),
                        ),
                        SizedBox(height: 25),
                        Column(
                          children: [
                            Container(
                              width: Get.width / 4.8,
                              height: Get.width / 4.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue[200]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    controller.mypoint == null
                                        ? ""
                                        : controller.mypoint!.value.toString(),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "نقاط",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.blue[200],
                              size: 35,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: Get.width / 4.8,
                              height: Get.width / 4.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.blue[200],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    controller.roundMoney!.value.toString(),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "دينار",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.blue[200],
                              size: 35,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: Get.width / 4.8,
                              height: Get.width / 4.8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue[200]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    controller.remainingPoints.toString(),
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "الباقي فقط",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.blue[200],
                              size: 35,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (c, index) {
                              return Container(
                                padding: EdgeInsets.all(20),
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                // width: 350,
                                // height: 150,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.moneyBill,
                                          color: Colors.white,
                                          size: 35,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "كل ${controller.cpoints![index].points} نقطة",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    Text(
                                      " تحصل على ${controller.cpoints![index].money} دينار عراقي ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (x, n) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                            itemCount: controller.cpoints!.length),
                        SizedBox(height: 25),
                        Text(
                          "نقاط المدن",
                          style: TextStyle(fontSize: 25, color: Colors.blue),
                        ),
                        Card(
                          color: Colors.white,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            height: 185,
                            width: 350,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 20),
                                  color: Colors.blue[50],
                                  height: 50,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "المدينة",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text(
                                        "النقاط",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (x, i) {
                                    return Container(
                                      padding: EdgeInsets.only(right: 20),
                                      color: i == 0
                                          ? Colors.pink[50]
                                          : Colors.grey[100],
                                      height: 50,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            controller.countries[i].name!,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Text(
                                            controller.countries[i].points
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (x, n) {
                                    return SizedBox(height: 5);
                                  },
                                  itemCount: controller.countries.length,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                )),
        ),
      ),
    );
  }
}
