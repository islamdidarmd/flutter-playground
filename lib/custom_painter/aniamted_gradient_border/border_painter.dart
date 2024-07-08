import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  final _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8
    ..color = Colors.black;

  LinearGradient get _gradient => const LinearGradient(colors: [
        Colors.yellowAccent,
        Colors.greenAccent,
        Colors.redAccent,
      ]);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCenter(
      center: center,
      width: size.width,
      height: size.height,
    );

    _paint.shader = _gradient.createShader(rect);
    canvas.drawCircle(center, 50, _paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) {
    return true;
  }
}
