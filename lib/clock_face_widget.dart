import 'package:custom_clock_designs/clock_faces/classic_clock_painter.dart';
import 'package:flutter/material.dart';

class ClockFaceWidget extends StatelessWidget {
  const ClockFaceWidget({Key? key}) : super(key: key);

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
