import 'package:flutter/material.dart';
import 'package:project_assignment/config/app_color.dart';
import 'package:project_assignment/page/active_todo.dart';
import 'package:project_assignment/page/add_todo.dart';
import 'package:project_assignment/page/all_todo.dart';
import 'package:project_assignment/page/complete_todo.dart';
import 'package:project_assignment/page/todo_page.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list_provider.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _pages = const [
    AllTodosPage(),
    ActiveTodosPage(),
    CompletedTodosPage(),
  ];

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // homepage and bottom navigation details page
    return Scaffold(
      backgroundColor: PsColors.backgroundColor2,
      appBar: AppBar(
        backgroundColor: PsColors.backgroundColor,
        title: const Text('Todo App'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(Icons.calendar_month),
          ),
        ],
      ),
      body: Consumer<TodoListProvider>(
        builder: (context, todoList, _) =>
            _pages.elementAt(context.watch<BottomNavigationIndex>().index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Active',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Completed',
          ),
        ],
        selectedItemColor: PsColors.backgroundColor,
        currentIndex: context.watch<BottomNavigationIndex>().index,
        onTap: (index) =>
            context.read<BottomNavigationIndex>().changeIndex(index),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PsColors.backgroundColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
