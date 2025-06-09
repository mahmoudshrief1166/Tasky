import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasky/core/component/task_list_widget.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/perefernces_manager.dart';
import 'package:tasky/models/tasks_modek.dart';



class CompleteTasksScreen extends StatefulWidget {
  const CompleteTasksScreen({super.key});

  @override
  State<CompleteTasksScreen> createState() => _CompleteTasksScreenState();
}

class _CompleteTasksScreenState extends State<CompleteTasksScreen> {
  List<TaskModel> completeTasks = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _loadTask();
  }

  void _loadTask() async {
    setState(() {
      isLoading = true;
    });

    final finalTask = PereferncesManager().getString(StorageKey.tasks);
    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;
      setState(() {
        completeTasks =
            taskAfterDecode.map((element) => TaskModel.fromJson(element)).where((element) => element.isDone).toList();
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _deleteTask(int? id) async {
    List<TaskModel> tasks = [];
    if (id == null) return;

    final finalTask = PereferncesManager().getString(StorageKey.tasks);
    if (finalTask != null) {
      final taskAfterDecode = jsonDecode(finalTask) as List<dynamic>;
      tasks = taskAfterDecode.map((element) => TaskModel.fromJson(element)).toList();
      tasks.removeWhere((e) => e.id == id);

      setState(() {
        completeTasks.removeWhere((task) => task.id == id);
      });

      final updatedTask = tasks.map((element) => element.toJson()).toList();
      PereferncesManager().setString(StorageKey.tasks, jsonEncode(updatedTask));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'Completed Tasks',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    value: 20,
                  ))
                : TaskListWidget(
                    tasks: completeTasks,
                    onTap: (value, index) async {
                      setState(() {
                        completeTasks[index!].isDone = value ?? false;
                      });

                      final allData = PereferncesManager().getString(StorageKey.tasks);

                      if (allData != null) {
                        List<TaskModel> allDataList =
                            (jsonDecode(allData) as List).map((element) => TaskModel.fromJson(element)).toList();
                        final int newIndex = allDataList.indexWhere((e) => e.id == completeTasks[index!].id);
                        allDataList[newIndex] = completeTasks[index!];

                        await PereferncesManager().setString(StorageKey.tasks, jsonEncode(allDataList));
                        _loadTask();
                      }
                    },
                    emptyMessage: 'No Task Found',
                    onDelete: (int? id) {
                      _deleteTask(id);
                    },
                    onEdit: () {
                      _loadTask();
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
