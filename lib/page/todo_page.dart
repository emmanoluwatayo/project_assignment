import 'package:flutter/material.dart';
import 'package:project_assignment/page/home_page.dart';
import 'package:project_assignment/provider/todo_list_provider.dart';
import 'package:provider/provider.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // todo page including bottom navigation page
    return ChangeNotifierProvider(
      create: (_) => TodoListProvider(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class BottomNavigationIndex extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }
}
