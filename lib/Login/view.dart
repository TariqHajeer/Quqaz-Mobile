import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quqaz/Binding/binding.dart';
import 'package:quqaz/Home/view.dart';
import 'package:quqaz/User_Account/controller.dart';

import 'controller.dart';

class Login extends StatelessWidget {
  //
  //
  final _formKey = GlobalKey<FormState>();
  //
  final a = TextEditingController();
  //
  final b = TextEditingController();
  //
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'خطأ',
            textAlign: TextAlign.right,
          ),
          content: Text(
            "خطأ بأسم المستخدم و كلمة المرور",
            textAlign: TextAlign.right,
          ),
          actions: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, c) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: c.maxHeight),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFe1e8f7),
                      const Color(0xFF7AAFEC),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                width: Get.width,
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.all(35),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تسجيل الدخول",
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          validator: (h) =>
                              h!.isEmpty ? "ادخل اسم المستخدم" : null,
                          controller: a,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 0),
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.teal)),
                              hintText: "اسم المستخدم",
                              suffixStyle: TextStyle(color: Colors.black),
                              suffixIcon: Container(
                                  color: Colors.grey,
                                  child: Icon(Icons.person))),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: b,
                          obscureText: true,
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
                              hintText: "كلمة المرور",
                              suffixStyle: TextStyle(color: Colors.black),
                              suffixIcon: Container(
                                  color: Colors.grey, child: Icon(Icons.lock))),
                        ),
                        SizedBox(height: 25),
                        Obx(
                          () => TextButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();

                              if (_formKey.currentState!.validate()) {
                                bool result =
                                    await controller.login(a.text, b.text);
                                if (result == false) {
                                  _showMyDialog();
                                } else {
                                  AppBinding().dependencies();
                                  Get.find<GetByTokenController>().getData();
                                  Get.off(() => Home());
                                }
                                // Get.to(Home());
                              }
                            },
                            // textColor: Colors.white,
                            // padding: const EdgeInsets.all(0.0),
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(80.0)),
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    const Color(0xFFBDD2FF),
                                    const Color(0xFF3D8FEE),
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    10,
                                  ),
                                ),
                              ),
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: controller.loading.value
                                  ? Center(
                                      heightFactor: 1,
                                      widthFactor: 1,
                                      child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 3,
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: const Text(
                                        'تسجيل الدخول',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Image.asset("images/quqaz.jpeg")
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
