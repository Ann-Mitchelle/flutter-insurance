import 'package:flutter/material.dart';
import 'package:insurance/config/constants.dart';

class customText extends StatelessWidget {
  final String label;
  final Color labelColor;
  final double fontSize;
  const customText(
      {super.key,
      required this.label,
      this.labelColor = appGreyColour,
      this.fontSize = 20});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: labelColor, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
