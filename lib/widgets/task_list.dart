import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/task_bloc.dart';
import 'task_card.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) return CircularProgressIndicator();
        if (state is TaskLoaded) {
          return ListView(
            children: state.tasks.map((task) => TaskCard(task: task)).toList(),
          );
        }
        return Center(child: Text('No Tasks'));
      },
    );
  }
}