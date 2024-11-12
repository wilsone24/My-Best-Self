import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';
import 'package:my_best_self/data/domain/entities/task.dart';
import 'package:my_best_self/data/domain/entities/task_hive.dart';

class TodoLocalDataSourceHive {
  addTodo(Task task) async {
    logInfo("Adding task to database: ${task.name}");
    TaskHive taskHive = TaskHive.fromTask(task: task);
    var box = Hive.box('todos');
    String key = 'task${task.id}${task.date}';
    await box.put(key, taskHive);

    // Solo imprime si se ha agregado una nueva tarea
    logInfo("Todo added successfully with key: $key.");
  }

  Future<List<Task>> getAllTodos() async {
    var box = Hive.box('todos');
    List<Task> tasks = box.keys
        .map((key) {
          TaskHive? taskHive = box.get(key);
          if (taskHive != null) {
            return taskHive.toTask();
          }
          return null;
        })
        .whereType<Task>() // Filtra nulos
        .toList();
    logInfo("Fetched ${tasks.length} todos from the database.");
    return tasks; // Devuelve la lista de todos
  }

  removeItem(Task task) async {
    logInfo("Deleting all todos with id: ${task.id}");
    var box = Hive.box('todos');
    List<String> keysToDelete = [];
    for (var key in box.keys) {
      if (key.startsWith('task${task.id}${task.date}')) {
        keysToDelete.add(key);
      }
    }
    if (keysToDelete.isNotEmpty) {
      await box.deleteAll(keysToDelete);
      logInfo("Deleted ${keysToDelete.length} todos with id ${task.id}.");
    } else {
      logWarning("No todos found with id ${task.id}. Nothing deleted.");
    }
  }

  updateTodo(Task task) async {
    logInfo("Updating todo in database with: ${task.id} ${task.date}");
    TaskHive taskHive2 = TaskHive.fromTask(task: task);
    String key = 'task${task.id}${task.date}';
    var box = Hive.box('todos');
    await box.put(key, taskHive2);
    logInfo("Todo with key $key updated successfully.");
    logInfo("New state ${task.count}");
  }

  deleteAll() async {
    logInfo("Deleting all todos from the database.");
    var box = Hive.box('todos');
    await box.clear();
    logInfo("All todos deleted successfully.");
  }
}
