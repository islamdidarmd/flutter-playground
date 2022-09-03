import 'package:flutter/material.dart';

import 'bottom_nav_item.dart';
import 'bottom_nav_item_caption.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({Key? key}) : super(key: key);

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavItem(
                    onTap: onTap,
                    selectedIndex: selectedIndex,
                    index: 0,
                    icon: Icons.home_filled,
                  ),
                  BottomNavItem(
                    onTap: onTap,
                    selectedIndex: selectedIndex,
                    index: 1,
                    icon: Icons.favorite,
                  ),
                  BottomNavItem(
                    onTap: onTap,
                    selectedIndex: selectedIndex,
                    index: 2,
                    icon: Icons.settings,
                  ),
                  BottomNavItem(
                    onTap: onTap,
                    selectedIndex: selectedIndex,
                    index: 3,
                    icon: Icons.account_circle_outlined,
                  ),
                ],
              ),
            ),
          ),
          BottomNavItemCaption(
            selectedIndex: selectedIndex,
          ),
        ],
      ),
    );
  }

  onTap(int index) {
    if (selectedIndex == index) {
      return;
    }
    setState(() {
      selectedIndex = index;
    });
  }
}
