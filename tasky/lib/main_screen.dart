import 'package:flutter/material.dart';
import 'package:tasky/complete_screen.dart';
import 'package:tasky/home_screen.dart';
import 'package:tasky/profile_screen.dart';
import 'package:tasky/todo_screen.dart' show TodoScreen;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [HomeScreen(), TodoScreen(), CompleteScreen(), ProfileScreen()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int? index) {
          if (index != null) {
            setState(() {
              _currentIndex = index;
            });
          }
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Home'),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
