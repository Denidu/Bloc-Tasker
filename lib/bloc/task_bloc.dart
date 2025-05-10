import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';

abstract class TaskEvent {}
class LoadTasks extends TaskEvent {}
class AddTask extends TaskEvent {
  final Task task;
  AddTask(this.task);
}

abstract class TaskState {}
class TaskInitial extends TaskState {}
class TaskLoading extends TaskState {}
class TaskLoaded extends TaskState {
  final List<Task> tasks;
  TaskLoaded(this.tasks);
}

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository repository;
  TaskBloc(this.repository) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async {
      emit(TaskLoading());
      final tasks = await repository.fetchTasks();
      emit(TaskLoaded(tasks));
    });
    on<AddTask>((event, emit) async {
      if (state is TaskLoaded) {
        final updated = List<Task>.from((state as TaskLoaded).tasks)..add(event.task);
        emit(TaskLoaded(updated));
      }
    });
  }
}