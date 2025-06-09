class TaskModel {
  final int id;
  final String taskName;
  final String taskDescription;
  final bool isHighPriority;
  bool isDone;

  TaskModel({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    required this.isHighPriority,
    this.isDone = false,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"] as int? ?? 0,
      taskName: json["taskName"] as String? ?? '',
      taskDescription: json["taskDescription"] as String? ?? '',
      isHighPriority: json["isHighPriority"] as bool? ?? false,
      isDone: json["isDone"] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "taskName": taskName,
      "taskDescription": taskDescription,
      "isHighPriority": isHighPriority,
      "isDone": isDone,
    };
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, taskName: $taskName, taskDescription: $taskDescription, '
           'isHighPriority: $isHighPriority, isDone: $isDone}';
  }
}
