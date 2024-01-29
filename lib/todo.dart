class Todo {
  final String id;
  late final String title;
  late final String description;
  bool isDone;
  bool isDeleted;

  Todo(
      {required this.id,
      required this.title,
      this.description = '',
      this.isDone = false,
      this.isDeleted = false});
}
