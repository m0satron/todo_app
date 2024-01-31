import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';
import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth;

    const double itemPadding = 8.0;
    const double itemMargin = 8.0;
    const double spacing = 8.0;

    int itemsPerRow = screenWidth < 600
        ? 1
        : screenWidth < 800
            ? 2
            : 4;

    cardWidth = (screenWidth -
            (spacing * (itemsPerRow - 1)) -
            (itemMargin * 2 * itemsPerRow)) /
        itemsPerRow;

    Color color = todo.isDone
        ? Colors.lightGreen
        : todo.isDeleted
            ? Colors.grey
            : Colors.white;

    return Container(
      width: cardWidth,
      height: cardWidth,
      margin: const EdgeInsets.all(itemMargin),
      padding: const EdgeInsets.all(itemPadding),
      child: Card(
        elevation: 1,
        color: color,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Text(todo.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5),
              ),
              const Spacer(),
              if (!todo.isDeleted)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (!todo.isDone)
                      IconButton(
                        icon: const Icon(Icons.check, color: Colors.green),
                        onPressed: () {
                          Provider.of<TodoProvider>(context, listen: false)
                              .updateTodo(
                            todo.id,
                            todo.title,
                            todo.description,
                            !todo.isDone,
                          );
                        },
                      ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Provider.of<TodoProvider>(context, listen: false)
                            .deleteTodo(todo.id);
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
