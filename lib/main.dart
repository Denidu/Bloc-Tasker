import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/task_bloc.dart';
import 'bloc/sync_bloc.dart';
import 'bloc/connection_bloc.dart';
import 'bloc/retry_bloc.dart';
import 'screens/task_screen.dart';
import 'repositories/task_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TaskRepository repository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TaskBloc(repository)..add(LoadTasks())),
        BlocProvider(create: (_) => SyncBloc()),
        BlocProvider(create: (_) => ConnectionBloc()),
        BlocProvider(create: (_) => RetryBloc()),
      ],
      child: MaterialApp(
        title: 'Pro Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TaskScreen(),
      ),
    );
  }
}
