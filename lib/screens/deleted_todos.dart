import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';

class DeletedTodosScreen extends StatelessWidget {
  const DeletedTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final deletedTodos = todoProvider.deletedTodos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Deleted Todos'),
      ),
      body: Wrap(
        alignment: WrapAlignment.start,
        spacing: 8.0,
        runSpacing: 8.0,
        children: deletedTodos.map((todo) => TodoItem(todo: todo)).toList(),
      ),
    );
  }
}
