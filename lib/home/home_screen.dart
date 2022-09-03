import 'package:flutter/material.dart';
import 'package:flutter_playground/custom_painter/custom_painter_screen.dart';
import 'package:flutter_playground/utils/navigation_utils.dart';

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
                context.navigateTo(const CustomPainterScreen());
              },
              child: const Text('Custom Painter Example'),
            ),
          ],
        ),
      ),
    );
  }
}
