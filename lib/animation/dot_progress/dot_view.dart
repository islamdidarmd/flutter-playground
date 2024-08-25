import 'package:flutter/material.dart';

class DotView extends StatefulWidget {
  const DotView(this.color, this.delay, {super.key});

  final Color color;
  final Duration delay;

  @override
  State<DotView> createState() => _DotViewState();
}

class _DotViewState extends State<DotView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    final seq = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 1, end: .5),
        weight: 30,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: .5, end: 1.5),
        weight: 40,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 1.5, end: 1),
        weight: 30,
      ),
    ]);
    _scaleAnimation = seq.animate(_controller);
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(widget.delay).then(
      (value) {
        _controller
          ..forward()
          ..repeat();
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: CustomPaint(
          painter: _DotPainter(widget.color),
        ),
      ),
    );
  }
}

class _DotPainter extends CustomPainter {
  final Color color;
  final _paint = Paint();

  _DotPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    _paint
      ..style = PaintingStyle.fill
      ..color = color;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 12, _paint);
  }

  @override
  bool shouldRepaint(_DotPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
