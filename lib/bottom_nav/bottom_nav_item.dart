import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final IconData icon;
  final Function(int index) onTap;

  const BottomNavItem({
    Key? key,
    required this.onTap,
    required this.selectedIndex,
    required this.index,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 250),
        offset: getIconOffset(selectedIndex, index),
        child: InkWell(
          onTap: () => onTap(index),
          child: Icon(
            icon,
            color: getColorForIndex(selectedIndex, index),
          ),
        ),
      ),
    );
  }

  Offset getIconOffset(int selected, int index) {
    if (selected == index) {
      return const Offset(0, -.3);
    } else {
      return const Offset(0, 0);
    }
  }

  Color getColorForIndex(int selected, int index) {
    if (selected == index) {
      return Colors.black54;
    } else {
      return Colors.black12;
    }
  }
}
