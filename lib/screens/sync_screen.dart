import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/sync_bloc.dart';
import '../widgets/sync_status.dart';

class SyncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sync')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.read<SyncBloc>().add(StartSync()),
            child: Text('Start Sync'),
          ),
          SyncStatus(),
        ],
      ),
    );
  }
}