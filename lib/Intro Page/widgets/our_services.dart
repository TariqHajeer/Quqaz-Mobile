import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller.dart';
import '../hex_color.dart';

class OurServices extends StatelessWidget {
  IntroController controller = Get.find();
  _launchUrl({required String url}) async {
    await canLaunch(url)
        ? await launch(url)
        : Get.snackbar('خطأ', 'لا يمكن فتح هذا الرابط');
  }

  OurServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'عملاء نتعامل معهم',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: HexColor('FC1225')),
              ),
            ),
            Expanded(
              // margin: EdgeInsets.symmetric(vertical: 8),
              // height: 130,
                child: Center(
                  child: Obx(() => controller.client == 0
                      ? Container()
                      : ListView.separated(
                    separatorBuilder: (c, i) {
                      return Divider();
                    },
                    // scrollDirection: Axis.horizontal,
                    itemCount: controller.client.length,
                    itemBuilder: (c, i) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10, left: 10, top: 5),
                        color: HexColor('5F6267').withOpacity(0.1),
                        child: ListTile(
                          title: Text(controller.client[i].name.toString()),
                          subtitle: Text(
                              controller.client[i].description.toString()),
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [

                          //     InkWell(
                          //       onTap: () async {
                          //         await _launchUrl(
                          //             url: controller.client[i].marketUrl
                          //                 .toString());
                          //       },
                          //       child: Text(
                          //         controller.client[i].marketUrl.toString(),
                          //         style: TextStyle(
                          //             color: Colors.blueAccent,
                          //             decoration: TextDecoration.underline),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          leading: Image.network(
                            'https://backend.quqaz.com/MarketLogo/2.png',
                            fit: BoxFit.cover,
                          ),
                          onTap: () async {
                            await _launchUrl(
                                url: controller.client[i].marketUrl
                                    .toString());
                          },
                        ),
                      );
                    },
                  )),
                ))
          ]),
    );
  }
}