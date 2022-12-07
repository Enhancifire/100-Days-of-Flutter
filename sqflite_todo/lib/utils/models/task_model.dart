// ignore_for_file: prefer_const_declarations

final String todoTable = "task";
final String taskTitle = "title";
final String taskDue = "due";
final String taskDone = "done";
final String taskDoBefore = "doBefore";
final String taskDesc = "desc";
final String taskId = "_id";

class Task {
  late final int? id;
  final String title;
  final String desc;
  final DateTime due;

  Task({
    this.id,
    required this.title,
    required this.desc,
    required this.due,
  });

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      taskTitle: title,
      taskDesc: desc,
      taskDue: due.toIso8601String(),
    };
    if (id != null) {
      map[taskId] = id;
    }
    return map;
  }

  factory Task.fromMap(Map<String, Object?> map) {
    return Task(
      title: map[taskTitle].toString(),
      desc: map[taskDesc].toString(),
      due: DateTime.parse(map[taskDue].toString()),
      id: int.parse(map[taskId].toString()),
    );
  }
}
