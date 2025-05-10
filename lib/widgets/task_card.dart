import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text("Assigned to: ${task.assignee}"),
        trailing: Icon(
          task.completed ? Icons.check : Icons.close,
          color: task.completed ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}