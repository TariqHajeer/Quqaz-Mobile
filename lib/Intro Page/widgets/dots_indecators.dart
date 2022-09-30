import 'dart:math';

import 'package:flutter/material.dart';

import '../hex_color.dart';

class DotsIndicators extends AnimatedWidget {
  final PageController pageController;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;
  static const double dotSize = 8;
  static const double maxZoom = 2.0;
  static const double dotSpacing = 25.0;

  const DotsIndicators({
    required this.pageController,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: pageController);

  Widget buildDots(int index) {
    double selected = Curves.easeOut.transform(
      max(
        0.0,
        1.0 -
            ((pageController.page ?? pageController.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (maxZoom - 1.0) * selected;
    return SizedBox(
      width: dotSpacing,
      child: Center(
        child: Material(
          color: HexColor('FC1225'),
          type: MaterialType.circle,
          child: SizedBox(
            width: dotSize * zoom,
            height: dotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, buildDots),
    );
  }
}