import 'package:flutter/material.dart';
import 'package:project_assignment/config/app_color.dart';
import 'package:project_assignment/provider/todo_list_provider.dart';
import 'package:provider/provider.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    TextEditingController subtextEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PsColors.backgroundColor,
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Todo title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: subtextEditingController,
              decoration: const InputDecoration(
                hintText: 'Todo details',
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                final String todoTitle = textEditingController.text;
                final String todoSubtitle = subtextEditingController.text;
                if (todoTitle.isNotEmpty || todoSubtitle.isNotEmpty) {
                  context.read<TodoListProvider>().add(todoTitle, todoSubtitle);
                  Navigator.pop(context);
                }
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: PsColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Add Todo',
                    style: TextStyle(color: PsColors.whiteColor),
                  ),
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     final String todoTitle = textEditingController.text;
            //     final String todoSubtitle = subtextEditingController.text;
            //     if (todoTitle.isNotEmpty || todoSubtitle.isNotEmpty) {
            //       context.read<TodoListProvider>().add(todoTitle, todoSubtitle);
            //       Navigator.pop(context);
            //     }
            //   },
            //   child: const Text('Add Todo'),
            // ),
          ],
        ),
      ),
    );
  }
}
