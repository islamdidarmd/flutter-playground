import 'package:flutter/material.dart';
import 'dot.dart';

class DotProgress extends StatefulWidget {
  const DotProgress({super.key});

  @override
  State<DotProgress> createState() => _DotProgressState();
}

class _DotProgressState extends State<DotProgress>
    with SingleTickerProviderStateMixin {
  final dots = [
    Dot(color: Colors.yellow[600]!),
    Dot(color: Colors.red[600]!),
    Dot(color: Colors.blue[600]!),
    Dot(color: Colors.purple[600]!),
  ];

  @override
  void initState() {
    super.initState();
    Future.forEach(dots, (dot) async {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        dot.animationController
          ..forward()
          ..addStatusListener((status) async {
            if (status == AnimationStatus.completed) {
              await Future.delayed(const Duration(milliseconds: 500));
              if (mounted) {
                dot.animationController
                  ..reset()
                  ..forward();
              }
            }
          });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dot Progress")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dots,
        ),
      ),
    );
  }
}
