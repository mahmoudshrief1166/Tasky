import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasky/core/components/custom_text_form_field.dart';
import 'package:tasky/core/models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool isHighPriority = true;
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              CustomTextFormField(
                controller: taskNameController,
                hintText: 'Finish UI design for login screen',
                title: 'Task Name',
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Task Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                controller: taskDescriptionController,
                hintText: 'Finish onboarding UI and hand off to devs by Thursday.',
                title: 'Task Description',
                maxLines: 5,
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('High Priority', style: Theme.of(context).textTheme.titleMedium),
                  Switch(
                    value: isHighPriority,
                    onChanged: (bool value) {
                      setState(() {
                        isHighPriority = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 90),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_key.currentState?.validate() ?? false) {
                    final SharedPreferences pref = await SharedPreferences.getInstance();

                    final String? list = pref.getString('tasks');

                    List<dynamic> listTasks = [];

                    if (list != null) {
                      listTasks = jsonDecode(list);
                    }

                    TaskModel taskModel = TaskModel(
                      id: listTasks.length + 1,
                      title: taskNameController.text,
                      description: taskDescriptionController.text,
                      isHighPriority: isHighPriority,
                    );

                    listTasks.add(taskModel.toMap());

                    String value = jsonEncode(listTasks);

                    await pref.setString('tasks', value);

                    taskNameController.clear();
                    taskDescriptionController.clear();

                    Navigator.pop(context);
                  }
                },
                label: Text('Add Task'),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
