import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';

class DoneTodosScreen extends StatelessWidget {
  const DoneTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final doneTodos = todoProvider.doneTodos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Todos'),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 8.0,
          runSpacing: 8.0,
          children: doneTodos.map((todo) => TodoItem(todo: todo)).toList(),
        ),
      ),
    );
  }
}
