import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';
import '../widgets/add_todo_widget.dart';

class CurrentTodosScreen extends StatelessWidget {
  const CurrentTodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);
    final currentTodos = todoProvider.todos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Todos'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AddTodoWidget(),
          Expanded(
              child: SingleChildScrollView(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children:
                  currentTodos.map((todo) => TodoItem(todo: todo)).toList(),
            ),
          ))
        ],
      ),
    );
  }
}
