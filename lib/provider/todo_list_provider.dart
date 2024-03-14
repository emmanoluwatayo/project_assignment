// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:project_assignment/model/todo_model.dart';

class TodoListProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void add(
    String title,
    String subtitle,
  ) {
    _todos.add(
      Todo(
        title: title,
        subtitle: subtitle,
      ),
    );
    notifyListeners();
  }

  void toggleCompletion(int index) {
    _todos[index].isCompleted = !_todos[index].isCompleted;
    notifyListeners();
  }

  void remove(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  List<Todo> get activeTodos =>
      _todos.where((todo) => !todo.isCompleted).toList();

  List<Todo> get completedTodos =>
      _todos.where((todo) => todo.isCompleted).toList();
}
