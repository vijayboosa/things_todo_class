class Todo {
  String todoName;
  bool isCompleted;
  bool important;
  Todo({this.todoName, this.important, this.isCompleted});
}

List<Todo> listOfTodos = [
  Todo(
    todoName: "Buy Eggs",
    isCompleted: false,
    important: false,
  ),
  Todo(
    todoName: "Mail manager",
    isCompleted: true,
    important: true,
  ),
  Todo(
    todoName: "Workout at 6AM",
    isCompleted: false,
    important: true,
  ),
  Todo(
    todoName: "Reach office by 8AM",
    isCompleted: true,
    important: true,
  ),
];
