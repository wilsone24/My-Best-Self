import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:my_best_self/data/domain/entities/task.dart';
import 'package:my_best_self/data/domain/use_case/todo_use_case.dart';

class DateTaskController extends GetxController {
  var selectedMonth = DateTime.now().month.obs;
  var selectedDay = DateTime.now().day.obs;
  var tasksByDayAndMonth = <String, List<Task>>{}.obs;
  DateTaskController() {
    getAllTodos();
  }
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
  TodoUseCase todoUseCase = Get.find();

  Future<void> getAllTodos() async {
    logInfo("userController -> getAllUsers");

    // Realiza la llamada para obtener los datos, pero sin modificar tasksByDayAndMonth directamente
    var list = await todoUseCase.getAllTodos();

    // Usa un mapa temporal para almacenar la nueva estructura de datos
    var tempTasksByDayAndMonth = <String, List<Task>>{};

    // Procesa la lista y almacena en el mapa temporal
    for (var task in list) {
      String key = task.date;
      if (!tempTasksByDayAndMonth.containsKey(key)) {
        tempTasksByDayAndMonth[key] = [];
      }
      tempTasksByDayAndMonth[key]?.add(task);
    }

    // Actualiza tasksByDayAndMonth con la nueva información
    tasksByDayAndMonth.clear();
    tasksByDayAndMonth.addAll(tempTasksByDayAndMonth);

    // Actualiza la vista al final
    tasksByDayAndMonth.refresh();
  }

  // Función para obtener la cantidad de días en un mes.
  List<int> generateDaysOfMonth(int month, int year) {
    int lastDay = DateTime(year, month + 1, 0).day;
    return List<int>.generate(lastDay, (index) => index + 1);
  }

  void removeAll() async {
    await todoUseCase.deleteAll();
    await getAllTodos();
  }

  void addTaskForSelectedDay(taskName, goal, nameGoal, image, id) async {
    DateTime startDate =
        DateTime(DateTime.now().year, selectedMonth.value, selectedDay.value);
    DateTime endDate = DateTime(DateTime.now().year, 12, 31);
    for (DateTime currentDate = startDate;
        currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate);
        currentDate = currentDate.add(const Duration(days: 1))) {
      String key = '${currentDate.month}-${currentDate.day}';

      Task newTask = Task(
          name: taskName,
          goal: int.tryParse(goal) ?? 0,
          nameGoal: nameGoal,
          image: image,
          points: "${int.parse(goal) * 100}",
          id: id,
          count: 0,
          isCompleted: false,
          date: key);
      await todoUseCase.addTodo(newTask);
    }
    await getAllTodos();
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

  void removeTask(int taskId) async {
    DateTime startDate =
        DateTime(DateTime.now().year, selectedMonth.value, selectedDay.value);

    // Fecha final (último día del año)
    DateTime endDate = DateTime(DateTime.now().year, 12, 31);

    // Recorre desde el día seleccionado hasta el último día del año
    for (DateTime currentDate = startDate;
        currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate);
        currentDate = currentDate.add(const Duration(days: 1))) {
      String key = '${currentDate.month}-${currentDate.day}';
      if (tasksByDayAndMonth.containsKey(key)) {
        final task =
            tasksByDayAndMonth[key]?.firstWhere((task) => task.id == taskId);
        if (task != null) {
          await todoUseCase.removeItem(task);
        }
      }
    }
    await getAllTodos();
  }

  void incrementTaskCount(Task task) async {
    task.incrementCount();
    await todoUseCase.updateTodo(task);
    await getAllTodos();
  }

  int calculateCompletedPoints() {
    int points = 0;

    // Recorre cada entrada en el mapa tasksByDayAndMonth
    for (var entry in tasksByDayAndMonth.entries) {
      List<Task> tasksOnDate = entry.value; // Obtén la lista de tareas

      // Recorre cada tarea en la lista
      for (var task in tasksOnDate) {
        if (task.isCompleted) {
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
      bool hasIncompleteTasks = previousTasks.any((task) => !task.isCompleted);
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
