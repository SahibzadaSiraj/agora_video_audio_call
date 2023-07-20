import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SizeBox extends StatelessWidget {
  SizeBox({super.key, required this.width, required this.hieght});
  double width;
  double hieght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: hieght,
    );
  }
}
