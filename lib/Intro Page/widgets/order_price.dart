import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quqaz/Intro%20Page/widgets/price_order_card.dart';

import '../controller.dart';
import '../hex_color.dart';

class OrderPrice extends StatelessWidget {
  IntroController controller = Get.find();

  OrderPrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height*0.05,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'أسعار التوصيل',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: HexColor('FC1225'),
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: Get.height*0.05,
          ),
          Expanded(
            // margin: EdgeInsets.symmetric(vertical: 8),
            // height: 130,
              child: Center(
                child: Obx(() => controller.countrieslength == 0
                    ? Container()
                    : ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: controller.countries.length,
                  itemBuilder: (c, i) {
                    return PriceOrderCard(
                      city: controller.countries[i].name!,
                      price:
                      controller.countries[i].deliveryCost!.toString(),
                    );
                  },
                )),
              ))
        ],
      ),
    );

    ;
  }
}