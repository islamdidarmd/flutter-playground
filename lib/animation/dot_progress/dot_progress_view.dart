import 'package:flutter/material.dart';
import 'package:flutter_playground/animation/dot_progress/dot_view.dart';

class DotProgressScreen extends StatelessWidget {
  const DotProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dot Progress")),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotView(Colors.yellow, Duration(milliseconds: 0)),
            DotView(Colors.red, Duration(milliseconds: 400)),
            DotView(Colors.blue, Duration(milliseconds: 800)),
            DotView(Colors.purple, Duration(milliseconds: 1200)),
          ],
        ),
      ),
    );
  }
}
