import 'package:get/get.dart';
import 'package:my_best_self/data/models/task.dart';

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
  void addTaskForSelectedDay(taskName, goal, nameGoal, image, id) {
    // Fecha inicial (día y mes seleccionados)
    DateTime startDate =
        DateTime(DateTime.now().year, selectedMonth.value, selectedDay.value);

    // Fecha final (último día del año)
    DateTime endDate = DateTime(DateTime.now().year, 12, 31);

    // Recorre desde el día seleccionado hasta el último día del año
    for (DateTime currentDate = startDate;
        currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate);
        currentDate = currentDate.add(const Duration(days: 1))) {
      String key = '${currentDate.month}-${currentDate.day}';
      if (!tasksByDayAndMonth.containsKey(key)) {
        tasksByDayAndMonth[key] = [];
      }

      Task newTask = Task(
          name: taskName,
          goal: int.tryParse(goal) ?? 0,
          nameGoal: nameGoal,
          image: image,
          points: "${int.parse(goal) * 100}",
          id: id);

      tasksByDayAndMonth[key]!.add(newTask);
    }

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

  void removeTask(int taskId) {
    // Fecha inicial (día y mes seleccionados)
    DateTime startDate =
        DateTime(DateTime.now().year, selectedMonth.value, selectedDay.value);

    // Fecha final (último día del año)
    DateTime endDate = DateTime(DateTime.now().year, 12, 31);

    // Recorre desde el día seleccionado hasta el último día del año
    for (DateTime currentDate = startDate;
        currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate);
        currentDate = currentDate.add(const Duration(days: 1))) {
      String key = '${currentDate.month}-${currentDate.day}';

      // Verifica si hay tareas en ese día
      if (tasksByDayAndMonth.containsKey(key)) {
        // Filtra las tareas que no tienen el id que queremos eliminar
        tasksByDayAndMonth[key]?.removeWhere((task) => task.id == taskId);

        // Si no quedan tareas en ese día, eliminar la clave del mapa
        if (tasksByDayAndMonth[key]?.isEmpty ?? true) {
          tasksByDayAndMonth.remove(key);
        }
      }
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

  void checkNegativeStreak() {
    // Obtener la fecha del día anterior
    DateTime previousDate = DateTime(
        DateTime.now().year, selectedMonth.value, selectedDay.value - 1);

    // Generar la clave para el día anterior
    String previousKey = '${previousDate.month}-${previousDate.day}';

    // Verificar si hay tareas para el día anterior
    if (tasksByDayAndMonth.containsKey(previousKey)) {
      List<Task> previousTasks = tasksByDayAndMonth[previousKey]!;
      bool hasIncompleteTasks =
          previousTasks.any((task) => !task.isCompleted.value);
      if (hasIncompleteTasks) {
        Get.snackbar(
          "Negative Streak Alert",
          "You have incomplete tasks from yesterday!",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}
