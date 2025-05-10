import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: TaskList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final task = Task(title: 'New Task', assignee: 'User');
          context.read<TaskBloc>().add(AddTask(task));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}