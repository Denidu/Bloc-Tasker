import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ConnectionEvent {}
class CheckConnection extends ConnectionEvent {}

abstract class ConnectionState {}
class Connected extends ConnectionState {}
class Disconnected extends ConnectionState {}

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  ConnectionBloc() : super(Connected()) {
    on<CheckConnection>((event, emit) {
      // Simulated check
      emit(Connected());
    });
  }
}
