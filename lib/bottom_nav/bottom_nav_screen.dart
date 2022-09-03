import 'package:flutter/material.dart';

import 'custom_bottom_nav.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Custom Bottom Nav'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          const CustomBottomNav(),
        ],
      ),
    );
  }
}
