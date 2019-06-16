import 'package:flutter/material.dart';
import 'package:flutter_app/TimeLog.dart';

class TimeLogList extends StatefulWidget {
  @override
  _TimeLogListState createState() => _TimeLogListState();
}

class _TimeLogListState extends State<TimeLogList> {
  List<TimeLog> _timeLogs = [];

  _buildTimeLog() {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildTimeLog(),
      itemCount: _timeLogs.length,
    );
  }
}
