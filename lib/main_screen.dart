import 'package:flutter/material.dart';
import 'package:task2/completed.dart';
import 'package:task2/home_screen.dart';
import 'package:task2/profile.dart';
import 'package:task2/to_do.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screans = [TaskPage(), ToDo(), Completed(), Profile()];
  int? _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'To Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt_outlined),
            label: 'Completed',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _currentindex ?? 0,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: screans[_currentindex ?? 0],
    );
  }
}
