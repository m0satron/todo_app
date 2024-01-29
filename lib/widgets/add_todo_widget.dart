import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class AddTodoWidget extends StatelessWidget {
  // You can use TextEditingController to handle input text
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: descriptionController,
          decoration: const InputDecoration(labelText: 'Description'),
        ),
        ElevatedButton(
          onPressed: () {
            if (titleController.text.isNotEmpty) {
              Provider.of<TodoProvider>(context, listen: false).addTodo(
                titleController.text,
                descriptionController.text,
              );
              titleController.clear();
              descriptionController.clear();
            }
          },
          child: const Text('Add Todo'),
        ),
      ],
    );
  }
}
