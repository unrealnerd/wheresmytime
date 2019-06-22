import 'package:flutter/material.dart';
import 'package:flutter_app/time_log_entry.dart';

class NewTimeLogDailog extends StatelessWidget {
  final textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter the new Task you would like track.'),
      content: TextField(
        controller: textEditingController,
      ),
      actions: <Widget>[
        FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        FlatButton(
            child: Text('Add'),
            onPressed: () {
              final timeLogItem = TimeLogEntry(textEditingController.value.text,
                  Duration.zero, DateTime.now());
              textEditingController.clear();
              Navigator.of(context).pop(timeLogItem);
            })
      ],
    );
  }
}
