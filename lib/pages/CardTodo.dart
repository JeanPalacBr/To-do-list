import 'package:flutter/cupertino.dart';
import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';

class CardTodo extends StatelessWidget {
  Todo todod;
  CardTodo(this.todod);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: todod.completed == 1 ? Colors.blueGrey : Colors.yellow[200],
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          padding(Icon(Icons.mic), 3,todod.type),
          Column(
            children: <Widget>[
              padding(Text(todod.title, style: TextStyle(fontSize: 18.0)), 1),
              padding(Text(todod.body, style: TextStyle(fontSize: 18.0)), 2),
            ],
          )
        ],
      ),
    );
  }

  Widget padding(Widget widget, int t, [String typeTodo]) {
    Widget pa;
    switch (t) {
      case 1:
        pa =
            Padding(padding: EdgeInsets.fromLTRB(10, 30, 10, 5), child: widget);
        break;
      case 2:
        pa =
            Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 30), child: widget);
        break;
      case 3:
        if (typeTodo == "DEFAULT") {
         pa = Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Icon(Icons.check));
        }
        if (typeTodo == "CALL") {
         pa = Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Icon(Icons.call));
        }
        if (typeTodo == "HOME_WORK") {
         pa = Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Icon(Icons.contacts));
        }
        if (typeTodo == null) {
         pa = Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Icon(Icons.dialpad));
        }
    }

    return pa;
  }
}
