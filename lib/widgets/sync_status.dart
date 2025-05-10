import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/sync_bloc.dart';

class SyncStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SyncBloc, SyncState>(
      builder: (context, state) {
        if (state is Syncing) return CircularProgressIndicator();
        if (state is SyncComplete) return Text('✅ Sync Complete');
        return Text('Idle');
      },
    );
  }
}