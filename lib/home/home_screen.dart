import 'package:flutter/material.dart';
import 'package:flutter_playground/animation/dot_progress/dot_progress_view.dart';
import 'package:flutter_playground/animation/fab_menu/fab_menu.dart';
import 'package:flutter_playground/animation/particles/particles_screen.dart';
import 'package:flutter_playground/bottom_nav/bottom_nav_screen.dart';
import 'package:flutter_playground/custom_painter/aniamted_gradient_border/animated_gradient_border_screen.dart';
import 'package:flutter_playground/custom_painter/clock_faces/clock_face_screen.dart';
import 'package:flutter_playground/ui_example/pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_playground/utils/navigation_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Playground'),
      ),
      body: ListView(
        children: const [
          _AnimationsTileView(),
          _CustomPainterTileView(),
          _CustomWidgetTileView(),
          _UIExampleView(),
        ],
      ),
    );
  }
}

class _AnimationsTileView extends StatelessWidget {
  const _AnimationsTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Animations'),
      children: [
        _SubContentView(
          const Text('Multiple Floating Menu'),
          onTap: () => context.navigateTo(const FabMenuScreen()),
        ),
        _SubContentView(
          const Text('Dot Progress'),
          onTap: () => context.navigateTo(const DotProgressScreen()),
        ),
        _SubContentView(
          const Text('Particles'),
          onTap: () => context.navigateTo(const ParticlesScreen()),
        ),
      ],
    );
  }
}

class _CustomPainterTileView extends StatelessWidget {
  const _CustomPainterTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Custom Painter'),
      children: [
        _SubContentView(
          const Text('Analog Clock'),
          onTap: () => context.navigateTo(const ClockFaceScreen()),
        ),
        _SubContentView(
          const Text('Animated Gradient Border'),
          onTap: () => context.navigateTo(const AnimatedGradientBorderScreen()),
        ),
      ],
    );
  }
}

class _CustomWidgetTileView extends StatelessWidget {
  const _CustomWidgetTileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('Custom Widgets'),
      children: [
        _SubContentView(
          const Text('Bottom Navigation Bar'),
          onTap: () => context.navigateTo(const BottomNavScreen()),
        ),
      ],
    );
  }
}

class _UIExampleView extends StatelessWidget {
  const _UIExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('UI Examples'),
      children: [
        _SubContentView(
          const Text('Pull to Refresh'),
          onTap: () => context.navigateTo(const PullToRefreshScreen()),
        ),
      ],
    );
  }
}


class _SubContentView extends StatelessWidget {
  const _SubContentView(this.text, {required this.onTap, super.key});

  final Widget text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: ListTile(
        onTap: onTap,
        title: text,
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
