import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:things_todo/models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  final Function homePageSetState;
  final Database db;

  const AddTodoScreen({Key key, @required this.homePageSetState, @required this.db}) : super(key: key);


  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  var todoString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: TextField(
              style: TextStyle(fontSize: 20.0),
              onChanged: (val) {
                todoString = val;
              },
              onSubmitted: () {

              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.access_time),
                  suffixIcon: Icon(Icons.access_alarms),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 3.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    borderSide: BorderSide(
                      color: Colors.greenAccent,
                      width: 3.0,
                    ),
                  )
//              border: OutlineInputBorder(
//                borderSide: BorderSide(
//                  color: Colors.greenAccent,
//                  width: 1.0,
//                ),
//              ),
                  ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              if (todoString.length <=3){
                print('todo length cannot be shorter.');
              }else {
              Todo todoTask = Todo(todoName: todoString, isCompleted: false, important: false);
              listOfTodos.add(todoTask);
              /*
              setState(() {});
              homePageSetState = setState;
              homePageSetState(() {});
               */
              widget.homePageSetState(() {});
              }
              print(listOfTodos);
            },
            child: Text(
              'Save Todo',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
