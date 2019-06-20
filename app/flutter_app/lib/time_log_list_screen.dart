import 'package:flutter/material.dart';
import 'package:flutter_app/time_log_entry.dart';
import 'package:flutter_app/new_time_log_dailog.dart';
import 'package:flutter_app/time_log_list.dart';

class TimeLogListScreen extends StatefulWidget {
  @override
  _TimeLogListScreenState createState() => _TimeLogListScreenState();
}

class _TimeLogListScreenState extends State<TimeLogListScreen> {
  final List<TimeLogEntry> _timeLogs = [];

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Where's My Time")),
        body: TimeLogList(
          timeLogs: _timeLogs,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _addTimeLog();
          },
        ));
  }
}
