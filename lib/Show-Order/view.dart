import 'package:awesome_dialog/awesome_dialog.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quqaz/Add-Order/controller.dart';
import 'package:quqaz/Add-Order/model.dart';
import 'package:quqaz/Orders/controller.dart';
import 'package:quqaz/Statements/view.dart';

class ShowOrder extends StatelessWidget {
  //
  final _formKey = GlobalKey<FormState>();
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
    var c = Get.put(GetCOrder());
    inspect(c.cOrder.value);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey,
          backgroundColor: Color(0xFF2F353A),
        ),
        body: Container(
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
                    "عرض الطلب   ",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              onPressed: () async {
                                await c.generateAndPrintArabicPdf();
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
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          // textAlign: TextAlign.center,
                          // enabled: false,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black26),
                          ),
                          // contentPadding: EdgeInsets.only(
                          //     left: 15, bottom: 11, top: 11, right: 15),
                          child: Text(c.cOrder.value.orderplaced!.name! +
                              " - " +
                              c.cOrder.value.monePlaced!.name!),
                        ),
                        SizedBox(height: 10),


                        InkWell(child:
                        Container(
                          // textAlign: TextAlign.center,
                          // enabled: false,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black26),
                          ),
                          // contentPadding: EdgeInsets.only(
                          //     left: 15, bottom: 11, top: 11, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(c.cOrder.value.agentPrintNumber?? ''),
                              SizedBox(width: 8),
                              Icon(Icons.print)
                            ],
                          ),
                        ),onTap: (){
                          c.cOrder.value.agentPrintNumber != null?
                          Get.to(Statements(),arguments:c.cOrder.value.agentPrintNumber!.toString()):print('');

                        },),

                        //
                        SizedBox(height: 10),
                        TextFormField(
                          enabled: c.cOrder.value.isSend == null
                              ? false
                              : !c.cOrder.value.isSend!,
                          controller: numCode,
                          onSaved: (s) {
                            c.myForm.value.code = s;
                          },
                          // initialValue: "s",
                          validator: (h) => h!.isEmpty ? "ادخل الكود" : null,
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
                            hintText: c.cOrder.value.code ?? "رقم الوصل",
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
                          enabled: c.cOrder.value.isSend == null
                              ? false
                              : !c.cOrder.value.isSend!,
                          controller: nameRecipient,
                          onSaved: (s) {
                            c.myForm.value.recipientName = s;
                          },
                          validator: (h) =>
                              h!.isEmpty ? "ادخل اسم المستخدم" : null,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText:
                                  c.cOrder.value.recipientName ?? "اسم المستلم",
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
                              onChanged: c.cOrder.value.isSend == null
                                  ? null
                                  : !c.cOrder.value.isSend!
                                      ? (val) {
                                          deliveryCost.text = c.countries
                                              .where((s) => s.id == val!.id)
                                              .first
                                              .deliveryCost
                                              .toString();
                                        }
                                      : null,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 15, bottom: 11, top: 11, right: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                              isExpanded: true,
                              isDense: false,
                              hint: Text(
                                c.cOrder.value.country!.name ?? "حالة الشحنة",
                                textAlign: TextAlign.right,
                              ),
                              items: c.countries
                                  .map(
                                    (element) => DropdownMenuItem<Countries>(
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
                            hintText: c.cOrder.value.deliveryCost == null
                                ? "كلفة التوصيل"
                                : "كلفة التوصيل  " +
                                    c.cOrder.value.deliveryCost.toString(),
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          enabled: c.cOrder.value.isSend == null
                              ? false
                              : !c.cOrder.value.isSend!,
                          onSaved: (s) {
                            c.myForm.value.cost = double.parse(s!);
                          },
                          validator: (h) =>
                              h!.isEmpty ? "ادخل كلفة الطلب مع التوصيل" : null,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: c.cOrder.value.cost == null
                                ? "كلفة الطلب مع التوصيل"
                                : c.cOrder.value.cost.toString(),
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
                          enabled: c.cOrder.value.isSend == null
                              ? false
                              : !c.cOrder.value.isSend!,
                          controller: address,
                          onSaved: (s) {
                            c.myForm.value.address = s;
                          },
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: c.cOrder.value.address ?? "عنوان المستلم",
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
                          onPressed: c.cOrder.value.isSend == null
                              ? null
                              : !c.cOrder.value.isSend!
                                  ? () {
                                      Get.to(() => ChoosOrder());
                                      // _showMaterialDialog();
                                    }
                                  : null,
                          child: Center(
                            child: Text("نوع الطلبية"),
                          ),
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          enabled: c.cOrder.value.isSend == null
                              ? false
                              : !c.cOrder.value.isSend!,
                          controller: phone,
                          onSaved: (s) {
                            c.myForm.value.recipientPhones!.value =
                                []; // !!! 10/11/2021 --- 8:03AM
                            c.myForm.value.recipientPhones!.add(s!);
                          },
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 0),
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: c.cOrder.value.recipientPhones == null
                                ? "رقم الهاتف"
                                : c.cOrder.value.recipientPhones!.isEmpty
                                    ? ""
                                    : c.cOrder.value.recipientPhones![0],
                            suffixStyle: TextStyle(color: Colors.black),
                            suffixIcon: Container(
                              color: Colors.grey,
                              child: Icon(Icons.call),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          controller: notes,
                          enabled: c.cOrder.value.isSend == null
                              ? false
                              : !c.cOrder.value.isSend!,
                          onSaved: (s) {
                            c.myForm.value.clientNote = s;
                          },
                          validator: (h) => h!.isEmpty ? "ادخل ملاحظات" : null,
                          textAlign: TextAlign.right,
                          decoration: new InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: c.cOrder.value.note ?? "ملاحظات",
                            hintTextDirection: TextDirection.rtl,
                          ),
                        ),
                        SizedBox(height: 25),
                        ElevatedButton(
                          // style: ,
                          onPressed: c.cOrder.value.isSend == null
                              ? null
                              : !c.cOrder.value.isSend!
                                  ? () async {
                                      if (c.myForm.value.orderItem == null) {
                                        _showEmpty();
                                      } else if (_formKey.currentState!
                                          .validate()) {
                                        var r =
                                            await Get.find<AddOrderController>()
                                                .checkCode(numCode.text);
                                        print("status check code : " + r);
                                        if (r == "true") {
                                          _showError();
                                        } else {
                                          _formKey.currentState!.save();
                                          c.myForm.value.date = DateTime.now()
                                              .toIso8601String()
                                              .toString();
                                          inspect(c.myForm.value);
                                          var t = await Get.find<GetCOrder>()
                                              .putOrder();
                                          if (t) {
                                            AwesomeDialog(
                                              context: Get.context!,
                                              animType: AnimType.SCALE,
                                              dialogType: DialogType.SUCCES,
                                              body: Text(
                                                'تم تحديث الإعلان بنجاح',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              title: 'This is Ignored',
                                              desc: 'This is also Ignored',
                                              btnOkOnPress: () {},
                                            )..show();

                                            _formKey.currentState!.reset();
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
                                          print("SUCCESS");
                                        }
                                      }
                                    }
                                  : null,
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChoosOrder extends StatefulWidget {
  @override
  _ChoosOrderState createState() => _ChoosOrderState();
}

class _ChoosOrderState extends State<ChoosOrder> {
  //
  Widget card(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Column(
        children: [
          TextFormField(
            enabled: false,
            initialValue: Get.find<GetCOrder>()
                .myForm
                .value
                .orderItem![index]
                .orderTypeName,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 7),
          TextFormField(
            initialValue: Get.find<GetCOrder>()
                .myForm
                .value
                .orderItem![index]
                .count
                .toString(),
            enabled: false,
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
                print(index);
                //
                setState(() {
                  Get.find<GetCOrder>().myForm.value.orderItem!.removeAt(index);
                  // list.removeAt(index);
                });
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
    var te = TextEditingController();
    //
    var d = TextEditingController();
    //
    OrderItem v = OrderItem();
    //
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
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
                  items: Get.find<AddOrderController>().orderTypes.map((value) {
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
            onSaved: (c) {
              v.count = int.parse(c!);
              // if (v.orderTypeName != null)
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
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  var t = Get.find<AddOrderController>()
                          .orderTypes
                          .where((g) => g.name == v.orderTypeName)
                          .length ==
                      0;
                  //
                  if (t) {
                    v.orderTypeId = null;
                  } else {
                    v.orderTypeId = v.orderTypeId;
                  }

                  setState(() {
                    // list.add(v);
                    var s =
                        Get.find<GetCOrder>().myForm.value.orderItem ?? true;
                    if (s == true) {
                      Get.find<GetCOrder>().myForm.value.orderItem =
                          <OrderItem>[].obs;
                      Get.find<GetCOrder>().myForm.value.orderItem!.add(v);
                      print("SUCCESS INSERT");
                    } else {
                      Get.find<GetCOrder>().myForm.value.orderItem!.add(v);
                      print("SUCCESS INSERT");
                    }
                  });
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
    );
  }

  //
  // List<OrderItem> list = [];
  //
  @override
  void initState() {
    super.initState();
    // var t = Get.find<AddOrderController>().myForm.value.orderItem ?? true;
    // if (t != true) {
    //   list = Get.find<AddOrderController>().myForm.value.orderItem!;
    // }
    // print(Get.find<AddOrderController>().myForm.value.orderItem!.isEmpty);
    // if (Get.find<AddOrderController>().myForm.value.orderItem == null)
  }

  //
  @override
  void dispose() {
    super.dispose();
    // if (_key.currentState!.validate()) {
    // _key.currentState!.save();
    // inspect(Get.find<GetCOrder>().myForm.value.orderItem);
    // }
  }
  //

  //
  var _key = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    // inspect(Get.find<GetCOrder>().myForm.value.orderItem);

    print("object");
    // inspect(list);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              children: [
                idget(),
                Container(
                  width: 500,
                  height: 500,
                  child: Get.find<GetCOrder>().myForm.value.orderItem != null
                      ? ListView.builder(
                          itemCount: Get.find<GetCOrder>()
                              .myForm
                              .value
                              .orderItem!
                              .length,
                          itemBuilder: (f, index) {
                            return card(index);
                          })
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
