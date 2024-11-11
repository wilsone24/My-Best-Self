import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:my_best_self/data/models/data_db.dart';
import 'package:my_best_self/domain/entities/task.dart';

class DateTaskController extends GetxController {
  var selectedMonth = DateTime.now().month.obs;
  var selectedDay = DateTime.now().day.obs;

  var tasksByDayAndMonth = <String, List<Task>>{}.obs;
  late final Box<DataDb> taskBox;

  DateTaskController({required this.taskBox});

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

  // Función para obtener la cantidad de días en un mes
  List<int> generateDaysOfMonth(int month, int year) {
    int lastDay = DateTime(year, month + 1, 0).day;
    return List<int>.generate(lastDay, (index) => index + 1);
  }

  // Función para obtener tareas de la fecha seleccionada desde Hive
  List<DataDb> getTasksForSelectedDay() {
    String key = '${selectedMonth.value}-${selectedDay.value}';
    return taskBox.values.where((task) {
      return '${task.date.month}-${task.date.day}' == key;
    }).toList();
  }

  // Función para agregar una tarea en Hive para la fecha seleccionada
  void addTaskForSelectedDay(
      String taskName, String goal, String nameGoal, String image, int id) {
    DateTime selectedDate =
        DateTime(DateTime.now().year, selectedMonth.value, selectedDay.value);

    DataDb newTask = DataDb(
      id: id,
      name: taskName,
      goal: int.tryParse(goal) ?? 0,
      nameGoal: nameGoal,
      points: "${int.parse(goal) * 100}",
      image: image,
      date: selectedDate,
    );

    taskBox.add(newTask);
  }

  void nextMonth() {
    if (selectedMonth.value < 12) {
      selectedMonth.value += 1;
    } else {
      selectedMonth.value = 1;
    }
    selectedDay.value = 1;
  }

  void previousMonth() {
    if (selectedMonth.value > 1) {
      selectedMonth.value -= 1;
    } else {
      selectedMonth.value = 12;
    }
    selectedDay.value = 1;
  }

  // Función para eliminar una tarea en Hive
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
        // Eliminar tareas en tasksByDayAndMonth que coincidan con el taskId
        tasksByDayAndMonth[key]?.removeWhere((task) => task.id == taskId);

        // Si no quedan tareas en ese día, eliminar la clave del mapa
        if (tasksByDayAndMonth[key]?.isEmpty ?? true) {
          tasksByDayAndMonth.remove(key);
        }
      }
    }

    // Buscar y eliminar la tarea de Hive si existe
    final taskToRemove = taskBox.values.firstWhere(
      (task) => task.id == taskId,
      orElse: () => DataDb(
        id: -1,
        name: '',
        goal: 0,
        nameGoal: '',
        points: '',
        image: '',
        date: DateTime.now(),
      ),
    );

    // Solo eliminar si se encontró una coincidencia válida en Hive
    if (taskToRemove.id != -1) {
      taskToRemove.delete(); // Elimina la tarea de Hive
    }
    tasksByDayAndMonth.refresh();
  }

  void incrementTaskCount(int index) {
    String key = '${selectedMonth.value}-${selectedDay.value}';

    // Verificar que existe la clave en el mapa y la tarea en el índice dado
    if (tasksByDayAndMonth.containsKey(key) &&
        index < tasksByDayAndMonth[key]!.length) {
      // Incrementar el contador de la tarea en memoria
      Task task = tasksByDayAndMonth[key]![index];
      task.incrementCount();

      // Buscar y actualizar la tarea en Hive
      final taskInDb = taskBox.values.firstWhere(
        (data) => data.id == task.id,
        orElse: () => DataDb(
            id: -1,
            name: '',
            goal: 0,
            nameGoal: '',
            points: '',
            image: '',
            date: DateTime.now()),
      );

      // Si se encontró la tarea en Hive, actualizar el valor de `count`
      if (taskInDb.id != -1) {
        taskInDb.count.value = task.count.value;
        taskInDb.save(); // Guardar los cambios en Hive
      }
    }

    tasksByDayAndMonth.refresh();
  }

  int calculateCompletedPoints() {
    int points = 0;

    // Recorre cada tarea en la base de datos
    for (var task in taskBox.values) {
      if (task.isCompleted.value) {
        points += int.parse(task.points);
      }
    }

    return points;
  }

  // Verifica si hay tareas incompletas del día anterior y muestra alerta
  void checkNegativeStreak() {
    // Obtener la fecha del día anterior
    DateTime previousDate = DateTime(
        DateTime.now().year, selectedMonth.value, selectedDay.value - 1);

    // Generar la clave para el día anterior
    String previousKey = '${previousDate.month}-${previousDate.day}';

    // Verificar si hay tareas para el día anterior en `tasksByDayAndMonth`
    bool hasIncompleteTasksInMemory = false;
    if (tasksByDayAndMonth.containsKey(previousKey)) {
      List<Task> previousTasks = tasksByDayAndMonth[previousKey]!;
      hasIncompleteTasksInMemory =
          previousTasks.any((task) => !task.isCompleted.value);
    }

    // Verificar si hay tareas incompletas en Hive para la misma fecha
    bool hasIncompleteTasksInHive = taskBox.values.any(
      (task) =>
          task.date.month == previousDate.month &&
          task.date.day == previousDate.day &&
          !task.isCompleted.value,
    );

    if (hasIncompleteTasksInHive) {
      Get.snackbar(
        "Negative Streak Alert",
        "You have incomplete tasks from yesterday!",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
