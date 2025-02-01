// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          gap: 8,
          tabMargin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          activeColor: Colors.white,
          tabActiveBorder: Border.all(
              color: Colors.white, width: 1, style: BorderStyle.solid),
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Shop ♡",
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: "Cart ♡",
            ),
          ]),
    );
  }
}
