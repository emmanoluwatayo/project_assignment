import 'package:flutter/material.dart';
import 'package:project_assignment/config/app_color.dart';
import 'package:project_assignment/provider/todo_list_provider.dart';
import 'package:provider/provider.dart';

class ActiveTodosPage extends StatelessWidget {
  const ActiveTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // functions to display active todos
    return Consumer<TodoListProvider>(
      builder: (context, todoList, _) => ListView.builder(
        itemCount: todoList.activeTodos.length,
        itemBuilder: (context, index) {
          final todo = todoList.activeTodos[index];
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 10,
              left: 10,
            ),
            child: Container(
              height: 82,
              padding: const EdgeInsets.only(
                right: 12,
              ),
              decoration: BoxDecoration(
                color: PsColors.whiteColor,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) {
                      todoList.toggleCompletion(todoList.todos.indexOf(todo));
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: TextStyle(
                          color: PsColors.backgroundColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        todo.subtitle,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
