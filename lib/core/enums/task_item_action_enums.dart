enum TaskItemActionEnums {
  markAsDone(name: 'Done | UnDone'),
  edit(name: 'Edit'),
  delete(name: 'Delete');

  final String name;
  const TaskItemActionEnums({required this.name});
}
