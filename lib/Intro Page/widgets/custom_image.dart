import 'package:flutter/material.dart';


class CustomImage extends StatelessWidget {
  final height;
  final width;
  final image;
  final borderWidth;

  const CustomImage(
      {Key? key, this.height, this.width, this.image, this.borderWidth = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 65,
      width: width ?? 65,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey.shade300),
          shape: BoxShape.circle,
          image:
          DecorationImage(fit: BoxFit.fitWidth, image: AssetImage(image))),
    );
  }
}