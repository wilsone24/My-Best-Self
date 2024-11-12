import 'package:get/get.dart';
import 'package:my_best_self/data/domain/entities/task.dart';
import 'package:my_best_self/data/domain/repositories/todo_repository.dart';

class TodoUseCase {
  TodoRepository repository = Get.find();
  Future<void> addTodo(Task task) async => await repository.addTodo(task);
  Future<List<Task>> getAllTodos() async => await repository.getAllTodos();
  Future<void> removeItem(Task task) async => await repository.removeItem(task);
  Future<void> updateTodo(todo) async => await repository.updateTodo(todo);
  Future<void> deleteAll() async => await repository.deleteAll();
}
