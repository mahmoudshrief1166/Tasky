import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2/core/models/tasks_modek.dart';
import 'package:task2/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<TasksModel> taskmodel = [];
  bool? isChecked = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/Thumbnail.png',
                    width: 42,
                    height: 42,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Evening ,Usama',
                        style: Theme.of(
                          context,
                        ).textTheme.displayMedium?.copyWith(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'One task at a time.One step\n closer',
                        style: Theme.of(
                          context,
                        ).textTheme.displayLarge?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yuhuu ,Your work Is',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(fontSize: 32),
                  ),
                  Row(
                    children: [
                      Text(
                        'almost done !',
                        style: Theme.of(
                          context,
                        ).textTheme.displayMedium?.copyWith(fontSize: 32),
                      ),
                      SizedBox(width: 5),
                      Image.asset('assets/images/wave.png'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'My Tasks',
                style: Theme.of(
                  context,
                ).textTheme.displayMedium?.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: taskmodel.length,
                itemBuilder: (context, index) {
                  final task = taskmodel[index];
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Color(0xff282828),
                        child: Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Text(
                              task.name,
                              style: Theme.of(
                                context,
                              ).textTheme.displayMedium?.copyWith(fontSize: 24),
                            ),
                            Spacer(),
                            Icon(Icons.more_vert, color: Color(0xffA0A0A0)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (builder) => AddTask()),
          );
          getData();
        },
        backgroundColor: Color(0xff15B86C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        label: Text('Add New Task'),
        icon: Icon(Icons.add),
        foregroundColor: Color(0xffFFFCFC),
      ),
    );
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasks = prefs.getString('tasks');

    if (tasks != null) {
      final decoded = jsonDecode(tasks);

      if (decoded is List) {
        setState(() {
          taskmodel = decoded.map((e) => TasksModel.fromMap(e)).toList();
        });
      } else {
        await prefs.remove('tasks'); 
      }
    }
  }
}
