import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SyncEvent {}
class StartSync extends SyncEvent {}

abstract class SyncState {}
class SyncIdle extends SyncState {}
class Syncing extends SyncState {}
class SyncComplete extends SyncState {}

class SyncBloc extends Bloc<SyncEvent, SyncState> {
  SyncBloc() : super(SyncIdle()) {
    on<StartSync>((event, emit) async {
      emit(Syncing());
      await Future.delayed(Duration(seconds: 2));
      emit(SyncComplete());
    });
  }
}