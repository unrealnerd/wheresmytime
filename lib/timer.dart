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
  bool showPlayButton = true;

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
      showPlayButton = false;
    });
  }

  void stop() {
    setState(() {
      stopwatch.stop();
      showPlayButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
    return Row(
      children: <Widget>[
        Expanded(child: Text(formattedTime)),
        Visibility(
            visible: showPlayButton,
            child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.green,
                  size: 40,
                ),
                onPressed: () {
                  start();
                })),
        Visibility(
            visible: !showPlayButton,
            child: IconButton(
                icon: Icon(Icons.pause, color: Colors.red, size: 40),
                onPressed: () {
                  stop();
                }))
      ],
    );
  }
}
