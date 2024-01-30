import 'package:flutter/foundation.dart';
import '../models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos =>
      _todos.where((todo) => !todo.isDone && !todo.isDeleted).toList();

  List<Todo> get doneTodos =>
      _todos.where((todo) => todo.isDone && !todo.isDeleted).toList();

  List<Todo> get deletedTodos =>
      _todos.where((todo) => todo.isDeleted).toList();

  void addTodo(String title, String description) {
    final newTodo = Todo(
      id: DateTime.now().toString(), // Unique ID based on the current time
      title: title,
      description: description,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  void updateTodo(
      String id, String newTitle, String newDescription, bool isDone) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.title = newTitle;
    todo.description = newDescription;
    todo.isDone = isDone;
    notifyListeners();
  }

  void deleteTodo(String id) {
    final todo = _todos.firstWhere((todo) => todo.id == id);
    todo.isDeleted = true;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
