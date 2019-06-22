import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/timer_text_formatter.dart';

class TimerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimerState(stopwatch: Stopwatch());
  }
}

class TimerState extends State<TimerWidget> {
  Timer timer;
  final Stopwatch stopwatch;

  TimerState({this.stopwatch}) {
    timer = new Timer.periodic(new Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  void start() {
    setState(() {
      stopwatch.start();
    });
  }

  void stop() {
    setState(() {
      stopwatch.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle timerTextStyle =
        const TextStyle(fontSize: 30.0, fontFamily: "Open Sans");
    String formattedTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
    return Row(
      children: <Widget>[
        Expanded(child: Text(formattedTime)),
        IconButton(
            icon: Icon(Icons.play_arrow),
            onPressed: () {
              start();
            })
      ],
    );
  }
}
