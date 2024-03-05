import 'package:firebase_app/utils/colorconstans.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.kPrimary, // Set the background color to red
      items: [
        BottomNavigationBarItem(
          icon: Icon(Ionicons.list),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.add_circle),
          label: 'Add User',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.person_circle),
          label: 'Profile',
        ),
      ],
    );
  }
}
