import 'package:f_202010_todo_class/pages/TypeTodoDDbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/todo.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String controllerType = "DEFAULT";
  String sel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text(
        'New todo',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
      ),
      content: Column(
        children: <Widget>[
          Text("Title", style: TextStyle(fontSize: 18.0)),
          Expanded(
              child: new TextField(
            autofocus: true,
            controller: controllerTitle,
            decoration: new InputDecoration(labelText: 'Title'),
          )),
          Text("Body", style: TextStyle(fontSize: 18.0)),
          Expanded(
              child: new TextField(
            controller: controllerBody,
            decoration: new InputDecoration(labelText: 'Body'),
          )),
          Expanded(child: TypeTodoDDbutton(
                  valchan: (valnew) => setState((){
                  controllerType = valnew;
              }),

          )),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
            child: Text('Add'),
            onPressed: () {
              final todo = new Todo(
                  title: controllerTitle.value.text,
                  body: controllerBody.value.text,
                  type: controllerType,
                  completed: 0);
              controllerTitle.clear();
              controllerBody.clear();
              
              Navigator.of(context).pop(todo);
            })
      ],
    );
  }
}
