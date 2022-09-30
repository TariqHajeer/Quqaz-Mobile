import 'package:flutter/material.dart';

import '../hex_color.dart';


class PriceOrderCard extends StatelessWidget {
  final String? city;
  final String? price;

  PriceOrderCard({Key? key, this.city, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.grey.shade200,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.electric_rickshaw_rounded,
            color: HexColor('FC1225'),
          ),
          Text(city!),
          // Spacer(),
          Text(
            price!,
            style: TextStyle(color: HexColor('FC1225')),
          ),
        ],
      ),
    );
  }
}