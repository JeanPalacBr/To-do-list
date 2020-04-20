import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/pages/CardTodo.dart';
import 'package:f_202010_todo_class/pages/NewTodoDialog.dart';
import 'package:flutter/material.dart';

class HomePageTodo extends StatefulWidget {
      

  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Colors.purple[400],
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton( 
        onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
         
    );
  }

  Widget _list(){
      return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return 
        Dismissible(
          key: ObjectKey(todos[posicion]),
          background: Container(
            color: Colors.red,
            alignment: AlignmentDirectional.centerStart,
            child: Text("Deleting",style: TextStyle(color: Colors.white),)),
            //Icon(Icons.delete, color: Colors.white)),
        child: CardTodo(todos[posicion]),
        
        onDismissed:(direction){
          setState(() {
            todos.removeAt(posicion);
          });
        },
        );
      },
    );
  }

  Widget _item(Todo element, int posicion){
    return Text('$posicion');
  }

  void _addTodo() async {
    final todo = await showDialog<Todo>(
        context: context,
        builder: (BuildContext context) {
          return NewTodoDialog();
        });
    if (todo != null) {
      setState(() {
        todos.add(todo);
      });
    }
  }
}