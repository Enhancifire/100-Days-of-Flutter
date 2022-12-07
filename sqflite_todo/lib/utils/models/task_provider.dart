import 'package:sqflite_todo/utils/database/db.dart';
import 'package:sqflite_todo/utils/models/task_model.dart';

class TaskProvider {
  List<Task> tasks = [];

  TaskProvider() {
    _getTasks();
  }

  _getTasks() async {
    TaskDatabase db = TaskDatabase();
    tasks = await db.getAllTasks();
  }
}
