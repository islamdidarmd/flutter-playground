import 'package:flutter/material.dart';

import 'dot_paint.dart';

class Dot extends StatefulWidget {
  final Color color;
  late final AnimationController animationController;

  Dot({
    super.key,
    required this.color,
  });

  @override
  State<Dot> createState() => _DotState();
}

class _DotState extends State<Dot> with SingleTickerProviderStateMixin {
  late final Animation<double> _scaleAnimation;
  late final Tween<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    widget.animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _scaleAnimation = TweenSequence(
      [
        TweenSequenceItem(
            tween: Tween<double>(begin: 1, end: .4)
                .chain(CurveTween(curve: Curves.fastOutSlowIn)),
            weight: 30),
        TweenSequenceItem(
            tween: Tween<double>(begin: .4, end: 1.5)
                .chain(CurveTween(curve: Curves.fastOutSlowIn)),
            weight: 40),
        TweenSequenceItem(
            tween: Tween<double>(begin: 1.5, end: 1)
              ..chain(CurveTween(curve: Curves.fastOutSlowIn)),
            weight: 30),
      ],
    ).animate(widget.animationController);
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      padding: const EdgeInsets.all(16),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: DotPaint(color: widget.color),
      ),
    );
  }
}
