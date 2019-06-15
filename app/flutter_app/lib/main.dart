// Import MaterialApp and other widgets which we can use to quickly create a material app
import 'package:flutter/material.dart';
import 'package:flutter_app/TimeLogList.dart';

void main() => runApp(new TimeLogApp());

class TimeLogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Time Log',
        home: Scaffold(
            appBar: AppBar(title: Text("Where's My Time")),
            body: TimeLogList()
    ),
    );
  }
}