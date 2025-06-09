import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/perefernces_manager.dart';
import 'package:tasky/models/tasks_modek.dart';


class HomeController with ChangeNotifier {
  List<TaskModel> tasksList = [];
  String? username = "Default";
  String? userImagePath;
  List<TaskModel> tasks = [];
  bool isLoading = false;
  int totalTask = 0;
  int totalDoneTasks = 0;
  double percent = 0;

  void init() {
    loadUserData();
    loadTask();
  }

  void loadUserData() {
    username = PereferncesManager().getString(StorageKey.username) ?? "Default";
    userImagePath = PereferncesManager().getString(StorageKey.userImage);
    notifyListeners();
  }

  Future<void> loadTask() async {
    isLoading = true;
    notifyListeners();

    final finalTask = PereferncesManager().getString(StorageKey.tasks);
    if (finalTask != null && finalTask.isNotEmpty) {
      try {
        tasks = await _parseTasks(finalTask);
      } catch (e) {
        debugPrint("Error decoding tasks: $e");
        tasks = [];
      }
    } else {
      tasks = [];
    }

    calculatePercent();

    isLoading = false;
    notifyListeners();
  }

  Future<List<TaskModel>> _parseTasks(String jsonString) async {
    return compute(_parseTaskList, jsonString);
  }

  static List<TaskModel> _parseTaskList(String jsonString) {
    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((e) => TaskModel.fromJson(e)).toList();
  }

  void calculatePercent() {
    totalTask = tasks.length;
    totalDoneTasks = tasks.where((e) => e.isDone).length;
    percent = totalTask == 0 ? 0 : totalDoneTasks / totalTask;
  }

  Future<void> doneTask(bool? value, int? index) async {
    if (index == null || index < 0 || index >= tasks.length) return;

    tasks[index].isDone = value ?? false;
    calculatePercent();

    final updatedTask = tasks.map((element) => element.toJson()).toList();
    await PereferncesManager().setString(
      StorageKey.tasks,
      jsonEncode(updatedTask),
    );

    notifyListeners();
  }

  Future<void> deleteTask(int? id) async {
    if (id == null) return;

    tasks.removeWhere((task) => task.id == id);
    calculatePercent();

    final updatedTask = tasks.map((element) => element.toJson()).toList();
    await PereferncesManager().setString(
      StorageKey.tasks,
      jsonEncode(updatedTask),
    );

    notifyListeners();
  }
}
