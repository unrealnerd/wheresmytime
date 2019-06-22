import 'package:flutter/material.dart';
import 'package:flutter_app/time_log_list_screen.dart';

void main() => runApp(new TimeLogApp());

class TimeLogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Time Log',
      home: TimeLogListScreen(),
    );
  }
}
