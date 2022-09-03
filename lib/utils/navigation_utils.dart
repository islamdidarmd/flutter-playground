import 'package:flutter/material.dart';

extension NavigationUtils on BuildContext {
  Future<Object?> navigateTo(Widget destination) {
    return Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => destination,
      ),
    );
  }
}
