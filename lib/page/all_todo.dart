import 'package:flutter/material.dart';
import 'package:project_assignment/config/app_color.dart';
import 'package:project_assignment/page/edit_todo.dart';
import 'package:project_assignment/provider/todo_list_provider.dart';
import 'package:provider/provider.dart';

class AllTodosPage extends StatelessWidget {
  const AllTodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // functions to display complete todos
    return Consumer<TodoListProvider>(
      builder: (context, todoList, _) => ListView.builder(
        itemCount: todoList.todos.length,
        itemBuilder: (context, index) {
          final todo = todoList.todos[index];
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
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
                    activeColor: PsColors.backgroundColor,
                    value: todo.isCompleted,
                    onChanged: (_) {
                      todoList.toggleCompletion(index);
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
                  const Spacer(),
                  GestureDetector(
                    child: Icon(
                      Icons.edit,
                      color: PsColors.backgroundColor,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditTodoPage(
                            todo: todo,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.delete,
                      color: PsColors.backgroundColor,
                    ),
                    onTap: () {
                      todoList.remove(index);
                    },
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
