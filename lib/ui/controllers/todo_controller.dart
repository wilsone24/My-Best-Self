import 'package:get/get.dart';
import 'package:my_best_self/models/task.dart';
class TodoController extends GetxController {
  // Lista de tareas, empieza vacía
  final _toDoList = <Task>[].obs;

  // Getter para acceder a la lista de tareas
  List<Task> get toDoList => _toDoList;

  // Método para agregar una nueva tarea a la lista
  void addTodo(Task task) {
    _toDoList.add(task);
  }

  void removeTask(Task task) {
    _toDoList.remove(task);
  }

  void incrementTaskCount(int index) {
    _toDoList[index].incrementCount();
  }

  int calculateCompletedPoints() {
    int points = 0;
    for (var task in _toDoList) {
      if (task.isCompleted.value) {
        points += int.parse(task.points);
      }
    }
    return points;
  }
}

