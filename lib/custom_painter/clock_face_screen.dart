import 'package:flutter/material.dart';

import 'clock_faces/classic_clock_painter.dart';

class ClockFaceScreen extends StatelessWidget {
  const ClockFaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Face'),
      ),
      body: Container(
        color: Colors.black87,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const ClassicClockWidget(),
      ),
    );
  }
}
