import '../models/task.dart';

class TaskRepository {
  Future<List<Task>> fetchTasks() async {
    return [
      Task(title: 'Initial Task', assignee: 'Admin')
    ];
  }
}