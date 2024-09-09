import 'package:flutter/material.dart';

Text customText(
  String text, {
  Color? color,
  double? fontSize,FontWeight? fontWeight
}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize, fontWeight:fontWeight ),
  );
}