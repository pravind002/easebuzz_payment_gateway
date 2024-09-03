import 'package:flutter/material.dart';

Text customText(
  String text, {
  Color? color,
  double? fontSize,
}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize),
  );
}