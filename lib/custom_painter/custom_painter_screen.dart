import 'package:flutter/material.dart';
import 'package:flutter_playground/utils/navigation_utils.dart';

import 'clock_face_screen.dart';

class CustomPainterScreen extends StatelessWidget {
  const CustomPainterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Painters'),
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
          ],
        ),
      ),
    );
  }
}
