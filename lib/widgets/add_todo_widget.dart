import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  static const maxLength = 120;

  bool get isInputValid => titleController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: titleController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Title'),
            onChanged: (value) => setState(() {}),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Description',
              counterText:
                  '${maxLength - descriptionController.text.length} characters remaining',
            ),
            maxLength: maxLength,
            maxLines: null,
            onChanged: (value) => setState(() {}),
          ),
        ),
        ElevatedButton(
          onPressed: isInputValid
              ? () {
                  Provider.of<TodoProvider>(context, listen: false).addTodo(
                    titleController.text,
                    descriptionController.text,
                  );
                  titleController.clear();
                  descriptionController.clear();
                }
              : null,
          child: const Text('Add Todo'),
        ),
      ],
    );
  }
}
