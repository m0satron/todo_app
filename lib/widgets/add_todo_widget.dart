import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  // You can use TextEditingController to handle input text
  final TextEditingController titleController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  static const maxLength = 120;

  bool get isInputValid => titleController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(labelText: 'Title'),
          onChanged: (value) => setState(() {}),
        ),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(
            labelText: 'Description',
            counterText:
                '${maxLength - descriptionController.text.length} characters remaining',
          ),
          maxLength: maxLength,
          maxLines: null,
          onChanged: (value) => setState(() {}),
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
