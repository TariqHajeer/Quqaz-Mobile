import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quqaz/API/ApiService.dart';
import 'controller.dart';

class Account extends GetView<GetByTokenController> {
  //
  //

  //
  var _key = GlobalKey<FormState>();
  //
  void _showErrorUserName() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text("خطأ"),
          content: Text("اسم المستخدم غير فعال"),
        );
      },
    );
  }

  //
  void _showErrorName() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text("خطأ"),
          content: Text("الاسم غير فعال"),
        );
      },
    );
  }

  //
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
          ),
        );
      },
    );
  }

  //
  void _showSccessName() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "تم",
            textAlign: TextAlign.right,
          ),
          content: Text(
            "تم طلب التعديل بنجاح سيظهر لك اشعار في حال تم الموافقة على طلبك",
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }

  //
  void _showSccess() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "تم",
            textAlign: TextAlign.right,
          ),
          content: Text(
            "تم التعديل بنجاح",
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    controller.getData();
    //

    ///
    return Container(
      alignment: Alignment.center,
      height: Get.height,
      color: Color(0xFF505050),
      child: Container(
          width: Get.width,
          height: Get.height,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.white,
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    // color: Colors.red,
                    height: 30,
                    child: IconButton(
                      onPressed: () {
                        controller.v.value = !controller.v.value;
                        print("HI");
                      },
                      icon: Icon(
                        !controller.v.value
                            ? Icons.edit
                            : Icons.arrow_back_rounded,
                        size: 30,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    maxRadius: 75,
                    child: Image.asset("images/user.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Visibility(
                        visible: controller.v.value,
                        child: SingleChildScrollView(
                          child: Form(
                            key: _key,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: controller.name,
                                  onSaved: (s) {
                                    controller.form.value.name = s;
                                  },
                                  validator: (h) =>
                                      h!.isEmpty ? "ادخل الاسم" : null,
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
                                    hintText: controller.getByToken.value.name,
                                    suffixStyle: TextStyle(color: Colors.black),
                                    suffixIcon: Container(
                                      color: Colors.grey,
                                      child: Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: controller.userName,
                                  onSaved: (s) {
                                    controller.form.value.userName = s;
                                  },
                                  validator: (h) =>
                                      h!.isEmpty ? "ادخل اسم المستخدم" : null,
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
                                    hintText:
                                        controller.getByToken.value.userName,
                                    suffixStyle: TextStyle(color: Colors.black),
                                    suffixIcon: Container(
                                      color: Colors.grey,
                                      child: Icon(
                                        Icons.person,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: controller.email,
                                  onSaved: (s) {
                                    controller.form.value.mail = s;
                                  },
                                  // validator: (h) =>
                                  //     h!.isEmpty ? "ادخل الإيميل" : null,
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
                                    hintText:
                                        controller.getByToken.value.mail ??
                                            "الإيميل",
                                    suffixStyle: TextStyle(color: Colors.black),
                                    suffixIcon: Container(
                                      color: Colors.grey,
                                      child: Icon(
                                        Icons.email,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                AddNumber(),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: controller.newPassword,
                                  onSaved: (s) {
                                    controller.form.value.password = s;
                                  },
                                  // validator: (h) => h!.isEmpty
                                  //     ? " ادخل كلمة المرور الجديدة"
                                  //     : null,
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
                                    hintText: "كلمة المرور الجديدة",
                                    suffixStyle: TextStyle(color: Colors.black),
                                    suffixIcon: Container(
                                      color: Colors.grey,
                                      child: Icon(Icons.lock),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                TextFormField(
                                  validator: (h) => controller
                                          .newPassword.text.isEmpty
                                      ? null
                                      : h!.isNotEmpty &&
                                              h == controller.newPassword.text
                                          ? null
                                          : "تأكيد كلمة المرور",
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
                                    hintText: "تأكيد كلمة المرور",
                                    suffixStyle: TextStyle(color: Colors.black),
                                    suffixIcon: Container(
                                      color: Colors.grey,
                                      child: Icon(
                                        Icons.email,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                    onPressed: () async {
                                      //
                                      // if (controller.getByToken.value.name !=
                                      //         controller.form.value.name ||
                                      //     controller
                                      //             .getByToken.value.userName !=
                                      //         controller.form.value.userName) {
                                      //   _showSccessName();
                                      // } else {
                                      //   _showSccess();
                                      // }
                                      //
                                      if (controller
                                          .form.value.phones!.isEmpty) {
                                        _showErrorNumber();
                                        return;
                                      }
                                      if (_key.currentState!.validate()) {
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
                                        //
                                        var r = await ApiService.checkName(
                                          controller.name.text,
                                        );
                                        print(r);
                                        //
                                        var t = await ApiService.checkUserName(
                                          controller.userName.text,
                                        );
                                        print(t);
                                        //
                                        if (r) {
                                          Get.back();
                                          _showErrorName();
                                          return;
                                        } else if (t) {
                                          Get.back();
                                          _showErrorUserName();
                                          return;
                                        }
                                        _key.currentState!.save();
                                        inspect(controller.form.value);
                                        var a = await controller
                                            .updateInformation();
                                        Get.back();
                                        if (a) {
                                          if (controller
                                                      .getByToken.value.name !=
                                                  controller.form.value.name ||
                                              controller.getByToken.value
                                                      .userName !=
                                                  controller
                                                      .form.value.userName) {
                                            _showSccessName();
                                          } else {
                                            _showSccess();
                                          }
                                          _key.currentState!.reset();
                                        }
                                        await controller.getData();
                                        controller.v.value =
                                            !controller.v.value;
                                      }
                                    },
                                    child: Center(child: Text("تحديث")))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !controller.v.value,
                        child: Obx(() => controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => Text(
                                      controller.getByToken.value.name ??
                                          "null",
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.person),
                                      SizedBox(width: 5),
                                      Obx(
                                        () => Text(
                                          controller
                                                  .getByToken.value.userName ??
                                              "null",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    children: controller
                                                .getByToken.value.phones !=
                                            null
                                        ? controller.getByToken.value.phones!
                                            .map(
                                              (e) => Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.person),
                                                    SizedBox(width: 5),
                                                    Text(
                                                      e.phone.toString(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList()
                                        : [],
                                  ),
                                  // Obx(
                                  //   () => Row(
                                  //     mainAxisAlignment: MainAxisAlignment.center,
                                  //     children: [
                                  //       Icon(Icons.person),
                                  //       SizedBox(width: 5),
                                  //       Column(
                                  //         children: controller
                                  //                     .getByToken.value.phones !=
                                  //                 null
                                  //             ? controller.getByToken.value.phones!
                                  //                 .map((e) => Text(
                                  //                       e.phone.toString(),
                                  //                       style: TextStyle(
                                  //                           fontSize: 20,
                                  //                           color: Colors.blue),
                                  //                     ))
                                  //                 .toList()
                                  //             : [],
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mail_rounded),
                                      SizedBox(width: 5),
                                      Obx(
                                        () => Text(
                                          controller.getByToken.value.mail ??
                                              "null",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Obx(
                                    () => controller.getByToken.value.address !=
                                            null
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.location_on_sharp),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Obx(
                                                () => Text(
                                                  controller.getByToken.value
                                                          .address ??
                                                      "null",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ),
                                ],
                              )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class AddNumber extends StatelessWidget {
  //
  final c = Get.find<GetByTokenController>();
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
              borderSide: new BorderSide(
                color: Colors.teal,
              ),
            ),
            hintText: "رقم هاتف جديد",
            suffixStyle: TextStyle(color: Colors.black),
            suffixIcon: Container(
              color: Colors.grey,
              child: Icon(Icons.call),
            ),
            prefixIcon: IconButton(
              color: Colors.blue,
              icon: Icon(Icons.add),
              onPressed: () {
                if (r.currentState!.validate()) {
                  // setState(() {
                  if (c.form.value.phones == null) {
                    c.form.value.phones = <String>[].obs;
                  }
                  c.form.value.phones!.add(t.text);
                  c.update();
                  r.currentState!.reset();
                  // });
                }
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
        readOnly: true,
        // enabled: false,
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
              c.form.value.phones!.removeAt(index);
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
        GetBuilder<GetByTokenController>(
          builder: (s) => s.getByToken.value.phones == null
              ? Container()
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (c, i) {
                    return elemet(
                      i,
                      s.form.value.phones![i].toString(),
                    );
                  },
                  itemCount: s.form.value.phones!.length,
                ),
        ),
        firstElemet(),
      ],
    );
  }
}
