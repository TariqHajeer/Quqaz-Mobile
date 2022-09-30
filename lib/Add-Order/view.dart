import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:pdf/widgets.dart';
import 'package:quqaz/Add-Order/controller.dart';
import 'package:quqaz/Add-Order/model.dart';

class AddOrder extends StatelessWidget {
  //
  final _formKey = GlobalKey<FormState>();
  //
  void _showError() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text("خطأ"),
          content: Text("رقم الوصل غير فعال"),
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

  void _showErrorNumber() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
            title: Text(
              "خطأ",
              textAlign: TextAlign.right,
            ),
            content: Text(
              "قم بإضافة رقم على الإقل",
              textAlign: TextAlign.right,
            ));
      },
    );
  }

  //
  var numCode = TextEditingController();
  //
  var nameRecipient = TextEditingController();
  //
  var deliveryCost = TextEditingController();
  //
  var cost = TextEditingController();
  //
  var address = TextEditingController();
  //
  var phone = TextEditingController();
  //
  var notes = TextEditingController();
  //
  //
  @override
  Widget build(BuildContext context) {
    var c = Get.put(AddOrderController());
    c.getCountries();
    // Get.find<AddOrderController>().myForm.value.recipientPhones!.value = [];
    return Container(
      color: Color(0xFF505050),
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: Colors.white,
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "إضافة طلب  ",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Form(
                key: _formKey,
                child: GetBuilder<AddOrderController>(
                    init: AddOrderController(),
                    builder: (controller) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: numCode,
                              onSaved: (s) {
                                c.myForm.value.code = s;
                              },
                              validator: (h) =>
                                  h!.isEmpty ? "ادخل الكود" : null,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Colors.teal,
                                  ),
                                ),
                                hintText: "رقم الوصل",
                                suffixStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  color: Colors.grey,
                                  child: Icon(
                                    Icons.edit,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              controller: nameRecipient,
                              onSaved: (s) {
                                c.myForm.value.recipientName = s;
                              },
                              // validator: (h) =>
                              //     h!.isEmpty ? "ادخل اسم المستلم" : null,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  hintText: "اسم المستلم",
                                  suffixStyle: TextStyle(color: Colors.black),
                                  suffixIcon: Container(
                                      color: Colors.grey,
                                      child: Icon(Icons.person))),
                            ),
                            SizedBox(height: 25),
                            Obx(() => DropdownButtonFormField<Countries>(
                                  onSaved: (v) {
                                    c.myForm.value.address = v!.name;
                                    c.myForm.value.countryId = v.id;
                                  },
                                  validator: (value) =>
                                      value == null ? 'ادخل المنطقة' : null,
                                  onChanged: (val) {
                                    deliveryCost.text = controller.countries
                                        .where((s) => s.id == val!.id)
                                        .first
                                        .deliveryCost
                                        .toString();
                                  },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )),
                                  isExpanded: true,
                                  hint: Text(
                                    "",
                                    textAlign: TextAlign.right,
                                  ),
                                  items: controller.countries
                                      .map(
                                        (element) =>
                                            DropdownMenuItem<Countries>(
                                          child: Text(element.name!),
                                          value: element,
                                        ),
                                      )
                                      .toList(),
                                )),
                            SizedBox(height: 25),
                            TextFormField(
                              // controller: deliveryCost,
                              textAlign: TextAlign.right,
                              // onSaved: (s) {
                              //   c.myForm.value.cost = double.parse(s!);
                              controller: deliveryCost,
                              // },
                              enabled: false,
                              validator: (h) =>
                                  h!.isEmpty ? "قم باختيار منطقة" : null,
                              decoration: new InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "كلفة التوصيل",
                                hintTextDirection: TextDirection.rtl,
                              ),
                            ),
                            SizedBox(height: 25),
                            TextFormField(
                              onSaved: (s) {
                                c.myForm.value.cost = double.parse(s!);
                              },
                              validator: (h) => h!.isEmpty
                                  ? "ادخل كلفة الطلب مع التوصيل"
                                  : null,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: "كلفة الطلب مع التوصيل",
                                suffixStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  color: Colors.grey,
                                  child: Icon(
                                    Icons.person,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            TextFormField(
                              controller: address,
                              onSaved: (s) {
                                c.myForm.value.address = s;
                              },
                              validator: (h) =>
                                  h!.isEmpty ? "ادخل كلمة السر" : null,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 0),
                                border: new OutlineInputBorder(
                                    borderSide:
                                        new BorderSide(color: Colors.teal)),
                                hintText: "عنوان المستلم",
                                suffixStyle: TextStyle(color: Colors.black),
                                suffixIcon: Container(
                                  color: Colors.grey,
                                  child: Icon(Icons.location_on_outlined),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            ElevatedButton(
                              // style: ,
                              onPressed: () {
                                Get.to(() => ChoosOrder());
                                // _showMaterialDialog();
                              },
                              child: Center(
                                child: Text("نوع الطلبية"),
                              ),
                            ),
                            SizedBox(height: 25),
                            //
                            AddNumber(),
                            //
                            SizedBox(height: 25),
                            TextFormField(
                              controller: notes,
                              onSaved: (s) {
                                c.myForm.value.clientNote = s;
                              },
                              // validator: (h) =>
                              //     h!.isEmpty ? "ادخل ملاحظات" : null,
                              textAlign: TextAlign.right,
                              decoration: new InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "ملاحظات",
                                hintTextDirection: TextDirection.rtl,
                              ),
                            ),
                            SizedBox(height: 25),
                            ElevatedButton(
                              // style: ,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();

                                if (controller.myForm.value.recipientPhones ==
                                        null ||
                                    controller.myForm.value.recipientPhones!
                                        .isEmpty) {
                                  _showErrorNumber();
                                  return;
                                }
                                // if (c.myForm.value.orderItem == null) {
                                // _showEmpty();
                                // } else

                                if (_formKey.currentState!.validate()) {
                                  var r = await c.checkCode(numCode.text);
                                  // print("status check code : " + r);
                                  if (r) {
                                    _showError();
                                    return;
                                  }
                                  _formKey.currentState!.save();
                                  c.myForm.value.date = DateTime.now()
                                      .toIso8601String()
                                      .toString();
                                  inspect(c.myForm.value);
                                  var t = await c.postCOrder();
                                  if (t) {
                                    AwesomeDialog(
                                      context: Get.context!,
                                      animType: AnimType.SCALE,
                                      dialogType: DialogType.SUCCES,
                                      body: Text(
                                        'تم إضافة الطلب بنجاح',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      title: 'This is Ignored',
                                      desc: 'This is also Ignored',
                                      btnOkOnPress: () {},
                                    )..show();

                                    _formKey.currentState!.reset();
                                    deliveryCost.text = "";
                                    address.text = "";
                                    nameRecipient.text = "";
                                    numCode.text = "";
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
                                  // print("SUCCESS");
                                }
                              },
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: Obx(() => c.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text("إضافة")),
                                ),
                              ),
                            ),
                          ],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddNumber extends StatelessWidget {
  //
  final c = Get.find<AddOrderController>();
  //
  Widget firstElemet() {
    //
    var t = TextEditingController();
    //
    var r = GlobalKey<FormState>();
    //
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        key: r,
        child: TextFormField(
          onChanged: (value){
            if (r.currentState!.validate()) {
              // setState(() {
              if (c.myForm.value.recipientPhones == null) {
                c.myForm.value.recipientPhones = <String>[].obs;
              }
              c.myForm.value.recipientPhones!.add(t.text);
              c.update();
              r.currentState!.reset();
              // });
            }
          },
          controller: t,
          keyboardType: TextInputType.number,
          validator: (h) => h!.isEmpty || h.length < 11 || h.length > 11
              ? "يجب ان يكون رقم الهاتف 11 حقل "
              : null,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal)),
            hintText: "رقم الهاتف",
            suffixStyle: TextStyle(color: Colors.black),
            suffixIcon: Container(
              color: Colors.grey,
              child: Icon(Icons.call),
            ),
            prefixIcon: IconButton(
              color: Colors.blue,
              icon: Icon(Icons.add),
              onPressed: () {
                // if (r.currentState!.validate()) {
                //   // setState(() {
                //   if (c.myForm.value.recipientPhones == null) {
                //     c.myForm.value.recipientPhones = <String>[].obs;
                //   }
                //   c.myForm.value.recipientPhones!.add(t.text);
                //   c.update();
                //   r.currentState!.reset();
                //   // });
                // }
              },
            ),
          ),
        ),
      ),
    );
  }

  //
  //
  Widget elemet(int index, String x) {
    // var t = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        // controller: t,
        // onSaved: (s) {
        //   Get.find<AddOrderController>().myForm.value.recipientPhones!.add(s!);
        // },
        // validator: (h) => h!.isEmpty ? "ادخل رقم الهاتف" : null,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          border: new OutlineInputBorder(
            borderSide: new BorderSide(
              color: Colors.teal,
            ),
          ),
          hintText: x,
          suffixStyle: TextStyle(color: Colors.black),
          suffixIcon: Container(
            color: Colors.grey,
            child: Icon(Icons.call),
          ),
          prefixIcon: IconButton(
            color: Colors.blue,
            icon: Icon(Icons.highlight_remove),
            onPressed: () {
              c.myForm.value.recipientPhones!.removeAt(index);
              c.update();
            },
          ),
        ),
      ),
    );
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    // inspect(c.myForm.value.recipientPhones!);
    // _list.isEmpty ? _list.add(firstElemet()) : null;
    return Column(
      children: [
        firstElemet(),
        GetBuilder<AddOrderController>(
          builder: (s) => s.myForm.value.recipientPhones == null
              ? Container()
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (c, i) {
                    return elemet(i, s.myForm.value.recipientPhones![i]);
                  },
                  itemCount: s.myForm.value.recipientPhones!.length,
                ),
        ),
      ],
    );
  }
}

class ChoosOrder extends StatelessWidget {
  //
  var c = Get.find<AddOrderController>();
  //
  Widget card(OrderItem orderItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(),
            ),
            child: Text(
              orderItem.orderTypeName!,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: 7),
          Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(),
            ),
            child: Text(
              orderItem.count.toString(),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.right,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                //
                // c.tempOrderTypes.forEach((element) {
                //   print(element.id);
                // });
                //
                if (orderItem.orderTypeId != null) {
                  var x = c.tempOrderTypes
                      .where(
                        (p0) => p0.id == orderItem.orderTypeId,
                      )
                      .first;
                  c.orderTypes.add(x);
                }
                // print("here x = " + x.toString());
                //
                // //
                //
                c.myForm.value.orderItem!.remove(orderItem);
                c.update();
                //
                // list.removeAt(index);
                // inspect(c.myForm.value.orderItem);
                // c.update();
              },
              child: Text(
                "حذف",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  //
  //
  //
  // int kindex = 0;
  //
  Widget idget() {
    //
    //
    var te = TextEditingController();
    //
    var d = TextEditingController();
    //
    OrderItem v = OrderItem();
    //
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Form(
        key: _key,
        child: Column(
          children: [
            TextFormField(
              onSaved: (x) {
                v.orderTypeName = x.toString();
              },
              textAlign: TextAlign.right,
              validator: (h) => h!.isEmpty ? "ادخل نوع الطلب" : null,
              controller: te,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: DropdownButton<OrderItem>(
                    icon: const Icon(Icons.arrow_downward),
                    underline: SizedBox(),
                    iconSize: 24,
                    elevation: 16,
                    onChanged: (newValue) {
                      te.text = newValue!.orderTypeName!;
                      v.orderTypeId = newValue.orderTypeId;
                    },
                    // value: ,
                    items: c.orderTypes.map((value) {
                      return DropdownMenuItem<OrderItem>(
                        value: OrderItem(
                            orderTypeId: value.id, orderTypeName: value.name),
                        child: Text(value.name!),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 7),
            TextFormField(
              keyboardType: TextInputType.number,
              onSaved: (c) {
                v.count = int.parse(c!);
                //    if (v.orderTypeName != null)
                //   Get.find<AddOrderController>().myForm.value.orderItem!.add(v);
              },
              controller: d,
              validator: (h) => h!.isEmpty ? "ادخل عدد الطلبات" : null,
              decoration: new InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "العدد",
                hintTextDirection: TextDirection.rtl,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () {
                  c.tempOrderTypes.forEach((element) {
                    print(element.name! + " " + element.id.toString());
                  });
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    var t = c.orderTypes
                            .where((g) => g.name == v.orderTypeName)
                            .length ==
                        0;
                    //
                    if (t) {
                      v.orderTypeId = null;
                    } else {
                      c.orderTypes.removeWhere(
                        (element) => element.name == v.orderTypeName,
                      );
                    }

                    // list.add(v);
                    var s = c.myForm.value.orderItem ?? true;
                    if (s == true) {
                      print(true);
                      c.myForm.value.orderItem = <OrderItem>[].obs;
                      c.myForm.value.orderItem!.add(v);
                      print("SUCCESS INSERT");
                    } else {
                      print(false);

                      c.myForm.value.orderItem!.add(v);
                      print("SUCCESS INSERT");
                    }
                    c.update();

                    te.text = "";
                    d.text = "";
                    v = OrderItem();
                  }
                },
                child: Text(
                  "إضافة",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //
  // List<OrderItem> list = [];
  // //
  // @override
  // void initState() {
  //   super.initState();
  // var t = Get.find<AddOrderController>().myForm.value.orderItem ?? true;
  // if (t != true) {
  //   list = Get.find<AddOrderController>().myForm.value.orderItem!;
  // }
  // print(Get.find<AddOrderController>().myForm.value.orderItem!.isEmpty);
  // if (Get.find<AddOrderController>().myForm.value.orderItem == null)
  // }

  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   // if (_key.currentState!.validate()) {
  //   // _key.currentState!.save();
  //   inspect(Get.find<AddOrderController>().myForm.value.orderItem);
  //   // }
  // }
  //
  var _key = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    //
    inspect(c.myForm.value.orderItem);
    //
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: GetBuilder<AddOrderController>(
          builder: (x) => Column(
            children: [
              idget(),
              x.myForm.value.orderItem != null
                  ? Column(
                      children: c.myForm.value.orderItem!
                          .map((element) => card(element))
                          .toList(),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
