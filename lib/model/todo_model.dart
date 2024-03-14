// Models for todos

class Todo {
  String title;
  String subtitle;
  bool isCompleted;

  Todo({
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  });
}
