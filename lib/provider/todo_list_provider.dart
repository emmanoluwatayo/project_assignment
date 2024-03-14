// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:project_assignment/model/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  final String _prefsKey = 'todos';

  List<Todo> get todos => _todos;
  TodoListProvider() {
    _loadTodos();
  }
  void _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = prefs.getString(_prefsKey);
    if (todosJson != null) {
      final List<dynamic> decoded = json.decode(todosJson);
      _todos = decoded.map((todo) => Todo.fromJson(todo)).toList();
      notifyListeners();
    }
  }

  void _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final todosJson = json.encode(_todos);
    await prefs.setString(_prefsKey, todosJson);
  }

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
