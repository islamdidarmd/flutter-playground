import 'package:custom_clock_designs/clock_faces/classic_clock_painter.dart';
import 'package:flutter/material.dart';

class ClockFaceList extends StatelessWidget {
  const ClockFaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clock Face List'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [ClassicClockWidget()],
      ),
    );
  }
}
