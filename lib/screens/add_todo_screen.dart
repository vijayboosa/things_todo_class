import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
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
                print(val);
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
            onPressed: () {},
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
