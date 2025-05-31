import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task2/core/component/text_form_field.dart';
import 'package:task2/core/models/tasks_modek.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _controllerTask = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isHighOiriority = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Task',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFCFC),
          ),
        ),
        backgroundColor: Color(0xff181818),
        foregroundColor: Color(0xffFFFCFC),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormFieldComponent(
                    name: 'Task Name',
                    title: 'Finish UI design for login screen',
                    controller: _controllerTask,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Task Name Is Required';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextFormFieldComponent(
                    name: 'Task Description',
                    title:
                        'Finish onboarding UI and hand off to devs by Thursday.',
                    controller: _controllerDescription,
                    maxlines: 5,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'High Pirority',
                        style: Theme.of(
                          context,
                        ).textTheme.displayMedium?.copyWith(fontSize: 16),
                      ),
                      Switch(
                        value: isHighOiriority,
                        onChanged: (currentvalue) {
                          setState(() {
                            isHighOiriority = currentvalue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (_key.currentState?.validate() ?? false) {
                          final SharedPreferences pref =
                              await SharedPreferences.getInstance();

                          final String? list = pref.getString('tasks');

                          List<dynamic> listTasks = [];

                          if (list != null) {
                            listTasks = jsonDecode(list);
                          }

                          TasksModel taskModel = TasksModel(
                            id: listTasks.length + 1,
                            name: _controllerTask.text,
                            description: _controllerDescription.text,
                            value: isHighOiriority,
                          );

                          listTasks.add(taskModel.toMap());

                           String ? value = jsonEncode(listTasks);

                          await pref.setString('tasks', value);
                          _controllerTask.clear();
                          _controllerDescription.clear();
                          Navigator.pop(context,true);
                        }
                      },
                      label: Text('Add Task'),
                      icon: Icon(Icons.add),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff15B86C),
                        foregroundColor: Color(0xffFFFCFC),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
