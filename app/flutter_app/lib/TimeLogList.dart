import 'package:flutter/material.dart';
import 'package:flutter_app/TimeLogListItem.dart';

class TimeLogList extends StatefulWidget {
  @override
  _TimeLogListState createState() => _TimeLogListState();
}

class _TimeLogListState extends State<TimeLogList> {
  List<TimeLogListItem> _timeLogs = [];

  Widget _buildTimeLogListItem(BuildContext context, int index) {
    final item = _timeLogs[index];

    return Card(
        child: ListTile(
          title: Text(item.task),
          trailing: Icon(Icons.play_arrow),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildTimeLogListItem,
      itemCount: _timeLogs.length,
    );
  }
}
