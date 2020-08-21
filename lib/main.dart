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
          ListTile(
            leading: Text('Checkbox'),
            title: Text('Todo Name'),
            trailing: Text('Important'),
          ),
          Divider(height: 10.0,),
          ...listOfTodos.map((e) => todoCard(e)).toList(),
        ],
      ),
    );
  }

  Widget todoCard(Todo todo) {
    return ListTile(
      leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (val) => setState(() {
                todo.isCompleted = val;
              })),
      title: Text(todo.todoName),
      trailing: IconButton(
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
    );
  }

// Widget todoCard() {
//   return Padding(
//     padding: const EdgeInsets.only(left: 20.0, right: 30.0),
//     child: Row(
//       children: [
//         Text('Buy Eggs'),
//         Spacer(),
//         Checkbox(
//             value: value,
//             onChanged: (val) {
//               print(val);
//               setState(() {
//                 value = val;
//               });
//             })
//       ],
//     ),
//   );
// }
}
