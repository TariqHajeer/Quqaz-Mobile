import 'dart:async';
import 'dart:math';
import 'dart:ui';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quqaz/API/ApiService.dart';
import 'package:quqaz/Home/view.dart';
import 'package:quqaz/Intro%20Page/hex_color.dart';
import 'package:quqaz/Intro%20Page/widgets/dots_indecators.dart';
import 'package:quqaz/Intro%20Page/widgets/main_section.dart';
import 'package:quqaz/Intro%20Page/widgets/order_price.dart';
import 'package:quqaz/Intro%20Page/widgets/our_services.dart';
import 'package:quqaz/Intro%20Page/widgets/shopping_services.dart';
import 'package:quqaz/Login/controller.dart';
import 'package:quqaz/Login/view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'controller.dart';



class IntroPageView extends StatelessWidget {
  IntroController introController = Get.put(IntroController());
  final _controller = PageController(viewportFraction: 1);
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);
  final List<Widget> _pages = <Widget>[];

  IntroPageView({Key? key}) : super(key: key);

  static onTap(index) {
    debugPrint("$index selected.");
  }

  @override
  Widget build(BuildContext context) {
    _pages.add(Main());
    _pages.add(OrderPrice());
    _pages.add(ShoppingService());
    _pages.add(OurServices());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('FC1225'),
        child: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          if (_controller.page!.toInt() >= _pages.length - 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
            // Navigator.pop(context);
          } else {
            _controller.animateToPage(
              _controller.page!.toInt() + 1,
              duration: _kDuration,
              curve: _kCurve,
            );
          }
        },
      ),
      body: IconTheme(
          data: IconThemeData(color: _kArrowColor),
          child: Padding(
            padding: const EdgeInsets.all(0.01),
            child: Stack(
              children: <Widget>[
                PageView(
                  controller: _controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: _pages,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    // color: Colors.grey[400]!.withOpacity(0.9),
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: DotsIndicators(
                        pageController: _controller,
                        itemCount: _pages.length,
                        onPageSelected: (int page) {
                          _controller.animateToPage(
                            page,
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}