import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../hex_color.dart';
import 'custom_image.dart';



class ShoppingService extends StatelessWidget {
  const ShoppingService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'خدمة التسوق و الشحن من جميع المواقع العالمية',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: HexColor('FC1225'),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: Get.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImage(
                          image: 'images/trends/ailex.png',
                        ),
                        CustomImage(
                          image: 'images/trends/alibaba.png',
                        ),
                        CustomImage(
                          image: 'images/trends/amazon.png',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: Get.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImage(
                          image: 'images/trends/ebay.png',
                        ),
                        CustomImage(
                          image: 'images/trends/trendyol.png',
                        ),
                        CustomImage(
                          image: 'images/trends/victorias.png',
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
              width: Get.width,
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'خدمة الصندوق البريدي',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: HexColor('FC1225'),
                        fontSize: 20
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: HexColor('FC1225'),
                    child: Icon(
                      Icons.unarchive_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
          // Divider(),
          // Container(
          //     margin: EdgeInsets.symmetric(vertical: 16),
          //     width: Get.width,
          //     child: TextButton(
          //       child: Text(
          //         'اتصل بنا',
          //         style: TextStyle(
          //             decoration: TextDecoration.underline,
          //             color: Colors.blue,
          //             fontSize: 16),
          //       ),
          //       onPressed: () {
          //         Get.to(ContactUs());
          //       },
          //     )),
        ]);
  }
}