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
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'isCompleted': isCompleted,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      subtitle: json['subtitle'],
      isCompleted: json['isCompleted'],
    );
  }
}
