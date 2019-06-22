import 'package:flutter/material.dart';
import 'package:flutter_app/timer.dart';
import 'time_log_entry.dart';

class TimeLogList extends StatelessWidget {
  TimeLogList({@required this.timeLogs});

  final List<TimeLogEntry> timeLogs;

  Widget _buildTimeLogEntry(BuildContext context, int index) {
    final item = timeLogs[index];

    return Card(
        child: ListTile(
      title: Text(item.task, style: Theme.of(context).textTheme.headline),
      subtitle: TimerWidget(),      
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildTimeLogEntry,
      itemCount: timeLogs.length,
    );
  }
}
