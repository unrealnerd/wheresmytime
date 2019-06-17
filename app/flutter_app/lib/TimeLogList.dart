import 'package:flutter/material.dart';
import 'package:flutter_app/TimeLogListItem.dart';

class TimeLogList extends StatefulWidget {
  @override
  TimeLogListState createState() => TimeLogListState();
}

class TimeLogListState extends State<TimeLogList> {
  List<TimeLogListItem> _timeLogs = [];

  TextEditingController textEditingController = new TextEditingController();

  _addTimeLog() {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
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
                    setState(() {
                      final item = TimeLogListItem(
                          textEditingController.value.text,
                          Duration.zero,
                          DateTime.now());

                      _timeLogs.add(item);
                      textEditingController.clear();

                      Navigator.of(context).pop();
                    });
                  })
            ],
          );
        });
  }

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
    return Scaffold(
        appBar: AppBar(title: Text("Where's My Time")),
        body: ListView.builder(
          itemBuilder: _buildTimeLogListItem,
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
