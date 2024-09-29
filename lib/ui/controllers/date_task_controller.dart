import 'package:get/get.dart';
import 'package:my_best_self/models/task.dart';

class DateTaskController extends GetxController {
  var selectedMonth = DateTime.now().month.obs;
  var selectedDay = DateTime.now().day.obs;

  var tasksByDayAndMonth = <String, List<Task>>{}.obs;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  // Función para obtener la cantidad de días en un mes.
  List<int> generateDaysOfMonth(int month, int year) {
    int lastDay = DateTime(year, month + 1, 0).day;
    return List<int>.generate(lastDay, (index) => index + 1);
  }

  // Función para agregar una tarea al día seleccionado.
  void addTaskForSelectedDay(taskName, goal, nameGoal, image) {
    String key = '${selectedMonth.value}-${selectedDay.value}';
    if (!tasksByDayAndMonth.containsKey(key)) {
      tasksByDayAndMonth[key] = [];
    }
    Task newTask = Task(
        name: taskName,
        goal: int.tryParse(goal) ?? 0,
        nameGoal: nameGoal,
        image: image,
        points: "${int.parse(goal) * 100}");

    tasksByDayAndMonth[key]!.add(newTask);
    tasksByDayAndMonth.refresh();
  }

  void nextMonth() {
    if (selectedMonth.value < 12) {
      selectedMonth.value += 1;
    } else {
      selectedMonth.value = 1;
    }
    selectedDay.value = 1; // Reiniciar al primer día del nuevo mes.
  }

  void previousMonth() {
    if (selectedMonth.value > 1) {
      selectedMonth.value -= 1;
    } else {
      selectedMonth.value = 12;
    }
    selectedDay.value = 1; // Reiniciar al primer día del nuevo mes.
  }

  void removeTask(Task task) {
    String key = '${selectedMonth.value}-${selectedDay.value}';
    if (tasksByDayAndMonth.containsKey(key)) {
      tasksByDayAndMonth["${selectedMonth.value}-${selectedDay.value}"]
          ?.remove(task);
    }
    tasksByDayAndMonth.refresh();
  }

  void incrementTaskCount(int index) {
    String key = '${selectedMonth.value}-${selectedDay.value}';
    if (tasksByDayAndMonth.containsKey(key)) {
      tasksByDayAndMonth["${selectedMonth.value}-${selectedDay.value}"]?[index]
          .incrementCount();
    }
    tasksByDayAndMonth.refresh();
  }

  int calculateCompletedPoints() {
    int points = 0;

    // Recorre cada entrada en el mapa tasksByDayAndMonth
    for (var entry in tasksByDayAndMonth.entries) {
      List<Task> tasksOnDate = entry.value; // Obtén la lista de tareas

      // Recorre cada tarea en la lista
      for (var task in tasksOnDate) {
        if (task.isCompleted.value) {
          points += int.parse(task.points);
        }
      }
    }
    return points;
  }
}
