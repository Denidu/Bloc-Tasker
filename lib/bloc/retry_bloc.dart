import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RetryEvent {}
class RetryAction extends RetryEvent {}

abstract class RetryState {}
class RetryIdle extends RetryState {}
class RetryInProgress extends RetryState {}
class RetrySuccess extends RetryState {}
class RetryFailed extends RetryState {}

class RetryBloc extends Bloc<RetryEvent, RetryState> {
  RetryBloc() : super(RetryIdle()) {
    on<RetryAction>((event, emit) async {
      emit(RetryInProgress());
      try {
        await Future.delayed(Duration(seconds: 1));
        emit(RetrySuccess());
      } catch (_) {
        emit(RetryFailed());
      }
    });
  }
}