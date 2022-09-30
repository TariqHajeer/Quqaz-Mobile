import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quqaz/Home/controller.dart';
import 'package:quqaz/Intro%20Page/view.dart';
import 'package:quqaz/Login/controller.dart';
import 'package:quqaz/Login/view.dart';
import 'package:quqaz/User_Account/controller.dart';

class MainDrawer extends GetView<GetByTokenController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset("images/quqaz.jpeg"),
              accountName: Obx(() => Text(
                    controller.getByToken.value.name ?? "null",
                    style: TextStyle(fontSize: 16),
                  )),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Color(0xFF2F353A),
              ),
            ),
            ListTile(
              title: Text(
                'حساب المستخدم',
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              leading: Icon(
                FontAwesomeIcons.user,
              ),
              onTap: () {
                Get.back();
                Get.find<HomeController>().index.value = 0;
              },
            ),
            ListTile(
              title: Text(
                'الرئيسية',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              leading: Icon(
                FontAwesomeIcons.tachometerAlt,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<HomeController>().index.value = 1;
              },
            ),
            ListTile(
              title: Text(
                'إضافة طلب',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              leading: Icon(
                FontAwesomeIcons.plusCircle,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<HomeController>().index.value = 2;
              },
            ),
            ListTile(
              title: Text(
                'الطلبات',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              leading: Icon(
                FontAwesomeIcons.boxOpen,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<HomeController>().index.value = 3;
              },
            ),
            ListTile(
              title: Text(
                'إرسال الطلبات إلى المندوب',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              leading: Icon(
                FontAwesomeIcons.boxOpen,
              ),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<HomeController>().index.value = 4;
              },
            ),
            ListTile(
              title: Text(
                'كشف حساب حسب نوع الشحنة',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              leading: Icon(FontAwesomeIcons.stackExchange),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<HomeController>().index.value = 5;
              },
            ),
            ListTile(
              title: Text(
                'طلب حساب',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              leading: Icon(FontAwesomeIcons.paypal),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<HomeController>().index.value = 6;
              },
            ),
            ListTile(
              title: Text(
                'الكشوفات',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              leading: (Icon(FontAwesomeIcons.stackExchange)),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<HomeController>().index.value = 7;
              },
            ),
            ListTile(
              title: Text(
                'نقاطي',
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              leading: (Icon(FontAwesomeIcons.bolt)),
              onTap: () {
                Navigator.of(context).pop();
                Get.find<HomeController>().index.value = 8;
              },
            ),
            ListTile(
                title: Text(
                  'تسجيل الخروج',
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                leading: Icon(
                  FontAwesomeIcons.signOutAlt,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('تسجيل الخروج'),
                        content: Text("هل انت متأكد من تسجيل الخروج ؟"),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text("YES"),
                            onPressed: () {
                              Get.delete();
                              // Get.find<LoginController>().dispose();
                              // Get.find<HomeController>().dispose();
                              var r = GetStorage();
                              r.remove("token");
                              Get.offAll(() => IntroPageView());
                            },
                          ),
                          ElevatedButton(
                            child: Text("NO"),
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
                }),
          ],
        ),
      ),
    );
  }
}
