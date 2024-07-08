import 'package:flutter/material.dart';

class BottomNavItemCaption extends StatelessWidget {
  final int selectedIndex;

  const BottomNavItemCaption({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      left: selectedIndex * (MediaQuery.of(context).size.width / 4),
      bottom: 0,
      child: Container(
          height: 40,
          padding: const EdgeInsets.only(top: 12),
          width: MediaQuery.of(context).size.width / 4,
          child: Center(
              child: Text(
            getTextForIndex(selectedIndex),
            style: Theme.of(context).textTheme.labelSmall,
          ))),
    );
  }

  String getTextForIndex(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Favorites";
      case 2:
        return "Settings";
      case 3:
        return "Profile";
    }
    return "";
  }
}
