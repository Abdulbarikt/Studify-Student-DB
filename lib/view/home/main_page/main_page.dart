import 'package:flutter/material.dart';
import 'package:firebase_app/view/home/listpage/Listpage.dart';
import 'package:firebase_app/view/home/add_taskpage/add_user.dart';
import 'package:firebase_app/view/home/profile_page/profile.dart';

import '../../../controller/bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    ListPage(),
    AddUser(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Studify'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
