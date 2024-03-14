import 'package:flutter/material.dart';
import 'package:project_assignment/config/app_color.dart';
import 'package:project_assignment/model/todo_model.dart';

class EditTodoPage extends StatelessWidget {
  final Todo todo;
  const EditTodoPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    TextEditingController subtextEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: PsColors.backgroundColor,
        title: const Text('Edit Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // title textfield
            TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Edit title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // edit details textfield
            TextField(
              controller: subtextEditingController,
              decoration: const InputDecoration(
                hintText: 'Edit details',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                // functionsto edit todos button
                GestureDetector(
                  onTap: () {
                    final String updatedTitle = textEditingController.text;
                    final String updatedSubtitle =
                        subtextEditingController.text;
                    if (updatedTitle.isNotEmpty || updatedSubtitle.isNotEmpty) {
                      todo.title = updatedTitle;
                      todo.subtitle = updatedSubtitle;
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: PsColors.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Update',
                        style: TextStyle(color: PsColors.whiteColor),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                // cancel button function
                GestureDetector(
                  onTap: () {
                    final String updatedTitle = textEditingController.text;
                    final String updatedSubtitle =
                        subtextEditingController.text;
                    if (updatedTitle.isNotEmpty || updatedSubtitle.isNotEmpty) {
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: PsColors.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: PsColors.whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
