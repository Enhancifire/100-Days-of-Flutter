import 'package:sqflite/sqflite.dart';
import 'package:sqflite_todo/utils/models/task_model.dart';

class TaskDatabase {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $todoTable (
	$taskId INTEGER PRIMARY KEY AUTOINCREMENT,
	$taskTitle TEXT NOT NULL,
	$taskDue DATE,
	$taskDesc TEXT
      );
      ''');
    });
  }
  // $taskId integer primary key autoincrement,
  // $taskTitle text not null,
  // $taskDue date,
  // $taskDone bool not null,
  // $taskDesc text,

  _initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = "$databasesPath/tasks.db";
    open(path);
  }

  TaskDatabase() {
    _initDB();
  }

  Future<Task> insert(Task task) async {
    task.id = await db.insert(todoTable, task.toMap());
    return task;
  }

  Future<List<Task>> getAllTasks() async {
    List<Map> taskMaps = await db.query(todoTable);

    return taskMaps
        .map((e) => Task.fromMap(e as Map<String, dynamic>))
        .toList();
  }

  Future<Task?> getTask(int id) async {
    List<Map> maps =
        await db.query(todoTable, where: '$taskId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Task.fromMap(maps.first as Map<String, dynamic>);
    }
    return null;
  }

  Future<Task> update(Task task) async {
    int id = await db.update(todoTable, task.toMap(),
        where: '$taskId = ?', whereArgs: [task.id]);
    Task? todo = await getTask(id);
    return todo!;
  }
}
