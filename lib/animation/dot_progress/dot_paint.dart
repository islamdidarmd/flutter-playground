import 'package:flutter/material.dart';

class DotPaint extends StatelessWidget {
  final Color color;

  const DotPaint({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DotPainter(color: color),
    );
  }
}

class _DotPainter extends CustomPainter {
  final Color color;
  final _paint = Paint()..style = PaintingStyle.fill;

  _DotPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    _paint.color = color;

    canvas.drawCircle(center, 16, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
