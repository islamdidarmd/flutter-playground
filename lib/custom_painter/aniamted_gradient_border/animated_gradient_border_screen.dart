import 'package:flutter/material.dart';
import 'package:flutter_playground/custom_painter/aniamted_gradient_border/border_painter.dart';

class AnimatedGradientBorderScreen extends StatefulWidget {
  const AnimatedGradientBorderScreen({super.key});

  @override
  State<AnimatedGradientBorderScreen> createState() =>
      _AnimatedGradientBorderScreenState();
}

class _AnimatedGradientBorderScreenState
    extends State<AnimatedGradientBorderScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Tween<double> _animTween;
  late final Animation<double> _turnAnim;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animTween = Tween<double>(begin: 1.0, end: 4.0);
    _turnAnim = _animTween.animate(_animationController);

    _animationController
    ..forward()
    ..repeat(reverse: false);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Gradient Border')),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Stack(
            children: [
              const _FlutterDashImage(),
              Positioned.fill(
                child: RotationTransition(
                  turns: _turnAnim,
                  child: CustomPaint(
                    painter: BorderPainter(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlutterDashImage extends StatelessWidget {
  const _FlutterDashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/img/flutter_dash.jpg', fit: BoxFit.fill);
  }
}
