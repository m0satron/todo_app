class Todo {
  final String id;
  String title;
  String description;
  bool isDone;
  bool isDeleted;

  Todo(
      {required this.id,
      required this.title,
      this.description = '',
      this.isDone = false,
      this.isDeleted = false});
}
