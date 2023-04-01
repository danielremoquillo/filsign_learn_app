import 'package:filsign_learn_app/screens/user/tabs/home_screen.dart';
import 'package:filsign_learn_app/screens/user/tabs/playground_screen.dart';
import 'package:filsign_learn_app/screens/user/tabs/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    const PlaygroundScreen(),
    const ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/house.png',
              width: 30,
            ),
            activeIcon: Image.asset(
              'assets/images/house_selected.png',
              width: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/playground.png',
              width: 30,
            ),
            activeIcon: Image.asset(
              'assets/images/playground_selected.png',
              width: 30,
            ),
            label: 'Playground',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/profile.png',
              width: 30,
            ),
            activeIcon: Image.asset(
              'assets/images/profile_selected.png',
              width: 30,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
