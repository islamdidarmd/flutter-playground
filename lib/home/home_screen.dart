import 'package:flutter/material.dart';
import 'package:flutter_playground/clock_faces/clock_face_screen.dart';
import 'package:flutter_playground/dot_progress/dot_progress.dart';
import 'package:flutter_playground/fab_menu/fab_menu.dart';
import 'package:flutter_playground/utils/navigation_utils.dart';

import '../bottom_nav/bottom_nav_screen.dart';
import '../particles/particles_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Playground'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.navigateTo(const ClockFaceScreen());
              },
              child: const Text('Clock Face Example'),
            ),
            ElevatedButton(
              onPressed: () {
                context.navigateTo(const BottomNavScreen());
              },
              child: const Text('Custom Bottom Nav'),
            ),
            ElevatedButton(
              onPressed: () {
                context.navigateTo(const ParticlesScreen());
              },
              child: const Text('Particles'),
            ),
            ElevatedButton(
              onPressed: () {
                context.navigateTo(const DotProgress());
              },
              child: const Text('Dot Progress'),
            ),
            ElevatedButton(
              onPressed: () {
                context.navigateTo(const FabMenu());
              },
              child: const Text('Fab Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
