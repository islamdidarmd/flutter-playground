import 'package:flutter/material.dart';

TextPainter getTextPainter({
  required String text,
  required double fontSize,
  required double width,
}) {
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.black,
        fontSize: fontSize,
      ),
    ),
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(minWidth: 0, maxWidth: width);
  return textPainter;
}
