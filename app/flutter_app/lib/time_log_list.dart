import 'package:flutter/material.dart';
import 'time_log_entry.dart';

class TimeLogList extends StatelessWidget {
  TimeLogList({@required this.timeLogs});

  List<TimeLogEntry> timeLogs;

  Widget _buildTimeLogEntry(BuildContext context, int index) {
    final item = timeLogs[index];

    return Card(
        child: ListTile(
      title: Text(item.task),
      trailing: Icon(Icons.play_arrow),
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
