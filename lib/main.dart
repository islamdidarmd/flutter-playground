import 'package:flutter/material.dart';
import 'package:flutter_playground/home/home_screen.dart';

void main() {
  runApp(const FlutterPlayGroundApp());
}

class FlutterPlayGroundApp extends StatelessWidget {
  const FlutterPlayGroundApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}