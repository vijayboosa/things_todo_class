import 'package:flutter/material.dart';
import 'package:things_todo/models/todo.dart';
import 'package:things_todo/screens/add_todo_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (ctx) => AddTodoScreen(
                      homePageSetState: setState,
                    )),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Things-Todo'),
      ),
      body: Column(
        children: [
          ...listOfTodos.map((e) => todoCard(e)).toList(),
        ],
      ),
    );
  }

  Widget todoCard(Todo todo) {
    return Dismissible(
      key: ObjectKey(todo),
      confirmDismiss: (val) async {
        switch(val) {
          case DismissDirection.startToEnd:
            return showDialog<bool>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Are you sure to Delete'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop<bool>(true);
                      },
                    ),
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop<bool>(false);
                      },
                    ),
                  ],
                );
              },
            );
            break;
          default:
            return false;
        }


      },
      onDismissed: (dir) {
        print(dir);
        listOfTodos.remove(todo);
        setState(() {});
      },
      background: Container(
        color: Colors.blue,
        width: double.infinity,
      ),
      child: ListTile(
        leading: Checkbox(
            value: todo.isCompleted,
            onChanged: (val) => setState(() {
                  todo.isCompleted = val;
                })),
        title: Text(todo.todoName),
        trailing: SizedBox(
          width: 100.0,
          child: Row(
            children: [
              IconButton(
                color: Colors.red,
                icon: Icon(Icons.delete_outline),
                onPressed: () {
                  listOfTodos.remove(todo);
                  setState(() {});
                },
              ),
              IconButton(
                  icon: todo.important
                      ? Icon(Icons.star, color: Colors.yellow[700])
                      : Icon(
                          Icons.star_border,
                        ),
                  onPressed: () {
                    setState(() {
                      todo.important = !todo.important;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
