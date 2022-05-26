import 'dart:async';
import 'dart:math';

import 'painter_utils.dart';
import 'package:flutter/material.dart';

class ClassicClockWidget extends StatefulWidget {
  const ClassicClockWidget({Key? key}) : super(key: key);

  @override
  _ClassicClockWidgetState createState() => _ClassicClockWidgetState();
}

class _ClassicClockWidgetState extends State<ClassicClockWidget> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: CustomPaint(
        painter: _ClockPainter(),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

class _ClockPainter extends CustomPainter {
  final strokePaint = Paint()
    ..color = Colors.white70
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8;

  final fillPaint = Paint()
    ..color = Colors.blueGrey
    ..style = PaintingStyle.fill;

  final centerFillPaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.fill;

  final secHandPaint = Paint()
    ..color = Colors.orange
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final circleRadius = min(size.width, size.height) / 2 - 50;
    final secHandLength = circleRadius - (circleRadius * .05);
    final minHandLength = circleRadius - (circleRadius * .15);
    final hourHandLength = circleRadius - (circleRadius * .35);

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);

    final minHandPaint = Paint()
      ..shader = const LinearGradient(colors: [
        Colors.purpleAccent,
        Colors.redAccent
      ]).createShader(Rect.fromCircle(center: center, radius: circleRadius / 2))
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    final hourHandPaint = Paint()
      ..shader = const LinearGradient(colors: [
        Colors.lightBlue,
        Colors.cyanAccent
      ]).createShader(Rect.fromCircle(center: center, radius: circleRadius / 2))
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    canvas.drawCircle(center, circleRadius, fillPaint);
    canvas.drawCircle(center, circleRadius, strokePaint);

    final dateTime = DateTime.now();
    final secHandX =
        centerX + secHandLength * sin(dateTime.second * 6 * pi / 180);
    final secHandY =
        centerY + secHandLength * -cos(dateTime.second * 6 * pi / 180);

    final minHandX =
        centerX + minHandLength * sin(dateTime.minute * 6 * pi / 180);
    final minHandY =
        centerY + minHandLength * -cos(dateTime.minute * 6 * pi / 180);

    final hourHandX = centerX +
        hourHandLength * sin(((dateTime.hour % 12) * 5) * 6 * pi / 180);
    final hourHandY = centerY +
        hourHandLength * -cos(((dateTime.hour % 12) * 5) * 6 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandPaint);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandPaint);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandPaint);

    canvas.drawCircle(center, (circleRadius * .08), centerFillPaint);

    final textPainter = getTextPainter(
      text: '12',
      width: size.width,
      fontSize: circleRadius * .25,
    );
    textPainter.paint(
      canvas,
      Offset(
        centerX - textPainter.width / 2,
        centerY - circleRadius,
      ),
    );

    final textPainter2 = getTextPainter(
      text: '3',
      width: size.width,
      fontSize: circleRadius * .25,
    );
    textPainter2.paint(
      canvas,
      Offset(
        centerX + circleRadius - textPainter2.width * 1.5,
        centerY - textPainter2.height / 2,
      ),
    );

    final textPainter3 = getTextPainter(
      text: '6',
      width: size.width,
      fontSize: circleRadius * .25,
    );
    textPainter3.paint(
      canvas,
      Offset(
        centerX - textPainter3.width / 2,
        centerY + circleRadius - textPainter3.height,
      ),
    );

    final textPainter4 = getTextPainter(
      text: '9',
      width: size.width,
      fontSize: circleRadius * .25,
    );
    textPainter4.paint(
        canvas,
        Offset(
          centerX - circleRadius + textPainter4.width / 2,
          centerY - textPainter4.height / 2,
        ));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
