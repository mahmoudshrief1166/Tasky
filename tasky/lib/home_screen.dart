import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/add_task_screen.dart';
import 'package:tasky/core/models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasksModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? tasks = prefs.getString('tasks');

    if (tasks != null) {
      final taskDecode = jsonDecode(tasks) as List<dynamic>;
      setState(() {
        tasksModel = taskDecode.map((e) => TaskModel.fromMap(e)).toList();
      });
      print(tasksModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage('assets/images/person.png')),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Evening, Usama",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "One task at a time. One step closer.",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Yuhuu ,Your work Is', style: Theme.of(context).textTheme.displayLarge),
            Row(
              children: [
                Text('almost done ! ', style: Theme.of(context).textTheme.displayLarge),
                SvgPicture.asset('assets/images/waving_hand.svg'),
              ],
            ),

            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: tasksModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF282828),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 44,
        child: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              onPressed: () async {
                final bool? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AddTaskScreen();
                    },
                  ),
                );
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            );
          },
        ),
      ),
    );
  }
}
