import 'package:flutter/material.dart';

import 'clock_face_list.dart';

void main() {
  runApp(const CustomClockDesignsApp());
}

class CustomClockDesignsApp extends StatelessWidget {
  const CustomClockDesignsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Clock Designs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClockFaceList(),
    );
  }
}