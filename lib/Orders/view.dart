import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quqaz/Add-Order/model.dart';
import 'package:quqaz/Orders/controller.dart';
import 'package:quqaz/Orders/model.dart';
import 'package:quqaz/Show-Order/view.dart';

class Orders extends StatelessWidget {
  //
  //
  TextEditingController? numCode = TextEditingController();
  //
  TextEditingController? nameRecipient = TextEditingController();
  //
  TextEditingController? deliveryCost = TextEditingController();
  //
  TextEditingController? cost = TextEditingController();
  //
  TextEditingController? address = TextEditingController();
  //
  TextEditingController? phone = TextEditingController();
  //
  TextEditingController? notes = TextEditingController();
  //
  var t1 = Template();
  //
  var t2 = Template();
  //
  var t3 = Countries();
  //
  var t4 = Regions();
  //
  final _controller = ScrollController();

  //
  @override
  Widget build(BuildContext context) {
    //
    //
    // controller.dispose();
    var controller = Get.put<GetCOrder>(GetCOrder());
    // controller.onReady();

    // controller.init();
    //
    double _w = MediaQuery.of(context).size.width;
    // print(Get.find<GetCOrder>().countries);
    print(controller.index.value);
    print(controller.resultIndex.value.toString());

    return Container(
      color: Color(0xFF505050),
      padding: EdgeInsets.all(12),
      child: SingleChildScrollView(
        controller: _controller,
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
                  Text(
                    "الطلبات  ",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: numCode,
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "الكود",
                      hintTextDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: nameRecipient,
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "اسم المستلم",
                      hintTextDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: phone,
                    decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "رقم الهاتف",
                      hintTextDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "حالة الشحنة",
                    style: TextStyle(fontSize: 18),
                  ),
                  Obx(
                    () => DropdownButtonFormField<Template>(
                      onSaved: (v) {},
                      onChanged: (val) {
                        t1 = val!;
                        print(val.name);
                      },
                      value: null,
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
                      items: controller.orderPlaced.isNotEmpty
                          ? controller.orderPlaced
                              .map(
                                (element) => DropdownMenuItem<Template>(
                                  child: Text(element.name ?? ""),
                                  value: element,
                                ),
                              )
                              .toList()
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "موقع المبلغ",
                    style: TextStyle(fontSize: 18),
                  ),
                  Obx(
                    () => DropdownButtonFormField<Template>(
                      onSaved: (v) {},
                      onChanged: (val) {
                        t2 = val!;
                        // print(val.name);
                      },
                      isDense: false,
                      value: null,
                      decoration: InputDecoration(
                          // isDense: false,
                          // hintTextDirection: TextDirection.ltr,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      isExpanded: true,
                      // value: t2,
                      items: controller.moneyPlaced.isNotEmpty
                          ? controller.moneyPlaced
                              .map(
                                (element) => DropdownMenuItem<Template>(
                                  child: Text(
                                    element.name!,
                                    textAlign: TextAlign.right,
                                  ),
                                  value: element,
                                ),
                              )
                              .toList()
                          : null,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "المدن",
                    style: TextStyle(fontSize: 18),
                  ),
                  Obx(() => DropdownButtonFormField<Countries>(
                        onSaved: (v) {
                          // c.myForm.value.address = v!.name;
                          // c.myForm.value.countryId = v.id;
                        },
                        isDense: false,
                        // value: t3,
                        value: null,

                        onChanged: (val) {
                          // deliveryCost.text = controller.countries
                          //     .where((s) => s.id == val!.id)
                          //     .first
                          //     .deliveryCost
                          //     .toString();
                          t3 = val!;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        isExpanded: true,
                        // hint: Text(
                        //   "المدن",
                        //   textAlign: TextAlign.right,
                        // ),
                        items: controller.countries.isNotEmpty
                            ? controller.countries
                                .map(
                                  (element) => DropdownMenuItem<Countries>(
                                    child: Text(element.name!),
                                    value: element,
                                  ),
                                )
                                .toList()
                            : null,
                      )),
                  SizedBox(height: 20),
                  Text(
                    "المنطقة",
                    style: TextStyle(fontSize: 18),
                  ),
                  Obx(() => DropdownButtonFormField<Regions>(
                        onSaved: (v) {},
                        isDense: false,
                        // value: t4,
                        onChanged: (val) {
                          t4 = val!;
                          // bloodGroupController.text = val!;
                        },

                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                        isExpanded: true,
                        // hint: Text(
                        //   "المنطقة",
                        //   textAlign: TextAlign.right,
                        // ),
                        items: controller.regions.isNotEmpty
                            ? controller.regions
                                .map(
                                  (element) => DropdownMenuItem<Regions>(
                                    child: Text(element.name!),
                                    value: element,
                                  ),
                                )
                                .toList()
                            : null,
                      )),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      // inspect(t2.id);
                      FocusScope.of(context).unfocus();

                      controller.index.value = 1;
                      await controller.getCOrder(
                        code: numCode!.text.isEmpty
                            ? null
                            : int.parse(numCode!.text),
                        countryId: t3.id,
                        monePlacedId: t2.id,
                        orderplacedId: t1.id,
                        page: controller.index.value,
                        phone:
                            phone!.text.isEmpty ? null : int.parse(phone!.text),
                        recipientName: nameRecipient!.text.isEmpty
                            ? null
                            : nameRecipient!.text,
                        regionId: t4.id,
                      );
                      _controller.animateTo(
                        _controller.position.maxScrollExtent + 700,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.ease,
                      );
                    },
                    child: Center(
                      child: Text(
                        "بحث",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Obx(() => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.cOrders.value.data != null &&
                        controller.cOrders.value.data!.isNotEmpty
                    ? GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: controller.cOrders.value.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () async {
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
                              await controller.getCOrderDetails(
                                  controller.cOrders.value.data![index].id!);
                              Get.back();
                              Get.to(() => ShowOrder());
                            },
                            child: AnimationConfiguration.staggeredGrid(
                              position: 0,
                              duration: Duration(milliseconds: 500),
                              columnCount: 2,
                              child: ScaleAnimation(
                                duration: Duration(milliseconds: 900),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: FadeInAnimation(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      bottom: _w / 70,
                                      left: _w / 70,
                                      right: _w / 60,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF63c2de),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 40,
                                          spreadRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "${controller.cOrders.value.data![index].code}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: _w / 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(width: 8),
                                              Icon(
                                                FontAwesomeIcons.dropbox,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                              // SizedBox(width: 15),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.print,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                controller
                                                        .cOrders
                                                        .value
                                                        .data![index]
                                                        .clientPrint!
                                                        .isEmpty
                                                    ? ""
                                                    : controller
                                                                .cOrders
                                                                .value
                                                                .data![index]
                                                                .clientPrint!
                                                                .length ==
                                                            1
                                                        ? controller
                                                            .cOrders
                                                            .value
                                                            .data![index]
                                                            .clientPrint![0]
                                                            .printNmber
                                                            .toString()
                                                        : controller
                                                                .cOrders
                                                                .value
                                                                .data![index]
                                                                .clientPrint![1]
                                                                .printNmber
                                                                .toString() +
                                                            " - " +
                                                            controller
                                                                .cOrders
                                                                .value
                                                                .data![index]
                                                                .clientPrint![0]
                                                                .printNmber
                                                                .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: _w / 22,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                controller.cOrders.value
                                                    .data![0].recipientPhones!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: _w / 22,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            controller
                                                    .cOrders
                                                    .value
                                                    .data![index]
                                                    .monePlaced!
                                                    .name! +
                                                " - " +
                                                controller
                                                    .cOrders
                                                    .value
                                                    .data![index]
                                                    .orderplaced!
                                                    .name!,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: _w / 25,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Expanded(child:
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller
                                                    .cOrders
                                                    .value
                                                    .data![index]
                                                    .country!
                                                    .name!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: _w / 20,
                                                ),
                                              ),
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),)
                                          // SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Text("لايوجد طلبات")),
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
                        await controller.getCOrder(
                          code: numCode!.text.isEmpty
                              ? null
                              : int.parse(numCode!.text),
                          countryId: t3.id,
                          monePlacedId: t2.id,
                          orderplacedId: t1.id ?? null,
                          page: 1,
                          phone: phone!.text.isEmpty
                              ? null
                              : int.parse(phone!.text),
                          recipientName: nameRecipient!.text.isEmpty
                              ? null
                              : numCode!.text,
                          regionId: t4.id,
                        );
                        _controller.animateTo(
                          _controller.position.maxScrollExtent + 700,
                          duration: Duration(milliseconds: 800),
                          curve: Curves.ease,
                        );
                        controller.index.value = 1;
                      },
                      child: Text("الأول")),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.getCOrder(
                        code: numCode!.text.isEmpty
                            ? null
                            : int.parse(numCode!.text),
                        countryId: t3.id,
                        monePlacedId: t1.id,
                        orderplacedId: t2.id,
                        page: controller.index.value == 1
                            ? 1
                            : --controller.index.value,
                        phone:
                            phone!.text.isEmpty ? null : int.parse(phone!.text),
                        recipientName: nameRecipient!.text.isEmpty
                            ? null
                            : nameRecipient!.text,
                        regionId: t4.id,
                      );
                      _controller.animateTo(
                        _controller.position.maxScrollExtent + 700,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.ease,
                      );
                    },
                    child: Text("السابق"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.getCOrder(
                        code: numCode!.text.isEmpty
                            ? null
                            : int.parse(numCode!.text),
                        countryId: t3.id,
                        monePlacedId: t1.id,
                        orderplacedId: t2.id,
                        page: controller.index.value ==
                                controller.resultIndex.value
                            ? controller.index.value
                            : ++controller.index.value,
                        phone:
                            phone!.text.isEmpty ? null : int.parse(phone!.text),
                        recipientName: nameRecipient!.text.isEmpty
                            ? null
                            : nameRecipient!.text,
                        regionId: t4.id,
                      );
                      _controller.animateTo(
                        _controller.position.maxScrollExtent + 700,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.ease,
                      );
                    },
                    child: Text("التالي"),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await controller.getCOrder(
                          code: numCode!.text.isEmpty
                              ? null
                              : int.parse(numCode!.text),
                          countryId: t3.id,
                          monePlacedId: t1.id,
                          orderplacedId: t2.id,
                          page: controller.resultIndex.value,
                          phone: phone!.text.isEmpty
                              ? null
                              : int.parse(phone!.text),
                          recipientName: nameRecipient!.text.isEmpty
                              ? null
                              : numCode!.text,
                          regionId: t4.id,
                        );
                        controller.index.value = controller.resultIndex.value;
                        _controller.animateTo(
                          _controller.position.maxScrollExtent + 700,
                          duration: Duration(milliseconds: 800),
                          curve: Curves.ease,
                        );
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
