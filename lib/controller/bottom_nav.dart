import 'package:firebase_app/utils/colorconstans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
            backgroundColor: AppColors.kPrimary),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
            label: 'Add User',
            backgroundColor: AppColors.kPrimary),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
            backgroundColor: AppColors.kPrimary),
      ],
    );
  }
}
