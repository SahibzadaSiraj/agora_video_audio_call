import 'package:flutter/material.dart';

AppBar customAppBar(
    {required String title,
    required bool isBack,
    required BuildContext context}) {
  return AppBar(
    centerTitle: true,
    leading: GestureDetector(
      onTap: isBack
          ? () {
              Navigator.pop(context);
            }
          : () {
              // ignore: avoid_print
              print("nothing");
            },
      child: isBack
          ? const Icon(
              Icons.arrow_back,
            )
          : const SizedBox(),
    ),
    title: Text(title),
  );
}
