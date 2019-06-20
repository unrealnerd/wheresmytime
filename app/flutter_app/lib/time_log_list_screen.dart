import 'package:flutter/material.dart';
import 'package:flutter_app/time_log_entry.dart';
import 'package:flutter_app/new_time_log_dailog.dart';

class TimeLogListScreen extends StatefulWidget {
  @override
  _TimeLogListScreenState createState() => _TimeLogListScreenState();
}

class _TimeLogListScreenState extends State<TimeLogListScreen> {
  List<TimeLogEntry> _timeLogs = [];

  _addTimeLog() async {
    final timeLogEntry = await showDialog<TimeLogEntry>(
        context: context,
        builder: (BuildContext buildContext) {
          return NewTimeLogDailog();
        });

    if (timeLogEntry != null) {
      setState(() {
        _timeLogs.add(timeLogEntry);
      });
    }
  }

  Widget _buildTimeLogEntry(BuildContext context, int index) {
    final item = _timeLogs[index];

    return Card(
        child: ListTile(
      title: Text(item.task),
      trailing: Icon(Icons.play_arrow),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Where's My Time")),
        body: ListView.builder(
          itemBuilder: _buildTimeLogEntry,
          itemCount: _timeLogs.length,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _addTimeLog();
          },
        ));
  }
}
