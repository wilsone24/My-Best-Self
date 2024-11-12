import 'package:loggy/loggy.dart';
import 'package:my_best_self/data/datasources/local/todo_local_datasource_hive.dart';

import '../entities/task.dart';

class TodoRepository {
  late TodoLocalDataSourceHive localDataSource;

  TodoRepository() {
    logInfo("Starting TodoRepository");
    localDataSource = TodoLocalDataSourceHive();
  }
  Future<void> addTodo(Task task) async => await localDataSource.addTodo(task);
  Future<List<Task>> getAllTodos() async => await localDataSource.getAllTodos();
  Future<void> removeItem(Task task) async => await localDataSource.removeItem(task);
  Future<void> updateTodo(Task todo) async => await localDataSource.updateTodo(todo);
  Future<void> deleteAll() async => await localDataSource.deleteAll();
}
