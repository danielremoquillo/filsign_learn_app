import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.splashColor,
      required this.text,
      required this.fontColor,
      required this.fontSize});
  final Color splashColor;
  final String text;
  final Color fontColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: splashColor,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, color: fontColor),
            textAlign: TextAlign.center,
          )),
    );
  }
}
