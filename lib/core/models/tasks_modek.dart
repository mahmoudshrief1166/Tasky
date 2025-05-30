class TasksModel {
  final int id;
  final String name;
  final String description;
  final bool value;

  TasksModel({
    required this.id,
    required this.name,
    required this.description,
    required this.value,
  });

  factory TasksModel.fromMap(Map<String, dynamic> map) {
    return TasksModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      value: map['value'],
    );
  }

  Map<String, dynamic> toMap(){
    return{
    'id':id,
    'name':name,
    'description':description,
    'value':value
    };

  }
}
