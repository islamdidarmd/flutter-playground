import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ParticlesScreen extends StatefulWidget {
  const ParticlesScreen({Key? key}) : super(key: key);

  @override
  _ParticlesScreenState createState() => _ParticlesScreenState();
}

class _ParticlesScreenState extends State<ParticlesScreen>
    with SingleTickerProviderStateMixin {
  final List<Particle> particles = [];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: addParticle,
              child: const Icon(Icons.favorite),
            ),
          ),
          ...getParticles().map((e) => e.buildWidget(context))
        ],
      ),
    );
  }

  List<Particle> getParticles() {
    return particles;
  }

  void addParticle() {
    final rand = Random();
    final left = rand.nextInt(MediaQuery.of(context).size.width.toInt()) * 1.0;
    particles.add(Particle(left, (particle) {
      particles.remove(particle);
      Future.microtask(() => setState(() {

      }));
    }));
    setState(() {});
  }
}

class Particle {
  var isEnded = false;
  double left;

  final Function(Particle) onEnd;

  Particle(this.left, this.onEnd);

  Widget buildWidget(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder(
      tween: IntTween(begin: 0, end: height.toInt()),
      duration: const Duration(seconds: 15),
      curve: Curves.fastLinearToSlowEaseIn,
      builder: (context, value, child) {
        if (height - value <= 5) {
          isEnded = true;
          onEnd(this);
        }
        return AnimatedPositioned(
          left: left,
          bottom: value * 1.0,
          curve: Curves.linear,
          duration: const Duration(seconds: 1),
          child: const Icon(
            Icons.favorite,
            color: Colors.pink,
          ),
        );
      },
    );
  }
}
