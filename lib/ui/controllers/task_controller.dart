import 'package:get/get.dart';

class TaskScore {
  String taskName;
  DateTime date;
  int score;

  TaskScore({
    required this.taskName,
    required this.date,
    required this.score,
  });
}

class Task {
  String name;
  bool? isDone;
  int? count;
  DateTime startDate;
  DateTime? lastActivityDate;
  int? goal;
  int score;

  Task({
    required this.name,
    this.isDone,
    this.count,
    required this.startDate,
    this.lastActivityDate,
    this.goal,
    this.score = 0,
  });
}

class TaskController extends GetxController {
  final _taskList = <Task>[].obs;
  final _taskScores = <TaskScore>[].obs;

  List<Task> get taskList => _taskList;
  List<TaskScore> get taskScores => _taskScores;

  void createTask(
      String name, DateTime startDate, bool? isDone, int? count, int? goal) {
    final task = Task(
      name: name,
      isDone: isDone,
      count: count,
      startDate: startDate,
      lastActivityDate: null,
      goal: goal ?? 0,
    );
    _taskList.add(task);
  }

  void updateTaskStatus(int index, DateTime lastActivityDate,
      {bool? isDone, int? count, int? goal}) {
    final task = _taskList[index];
    if (isDone != null) {
      task.isDone = isDone;
      task.score = isDone ? 10 : 0;
    } else if (count != null) {
      task.count = count;
      task.score = (count >= goal!) ? 10 : 0;
    }
    task.lastActivityDate = lastActivityDate;
    _taskList[index] = task;

    _taskScores.add(TaskScore(
      taskName: task.name,
      date: task.lastActivityDate!,
      score: task.score,
    ));
  }

  void deleteTask(int index) {
    _taskList.removeAt(index);
  }

  String getAverageScoreForTask(String taskName) {
    var scoresForTask =
        _taskScores.where((score) => score.taskName == taskName).toList();
    if (scoresForTask.isEmpty) return "0.00";
    double average = scoresForTask.map((e) => e.score).reduce((a, b) => a + b) /
        scoresForTask.length;
    return average.toStringAsFixed(2);
  }

  String getAverageScoreForDate(DateTime date) {
    var scoresForDate =
        _taskScores.where((score) => isSameDay(score.date, date)).toList();
    if (scoresForDate.isEmpty) return "0.00";
    double average = scoresForDate.map((e) => e.score).reduce((a, b) => a + b) /
        scoresForDate.length;
    return average.toStringAsFixed(2);
  }

  String getGlobalAverageScore() {
    if (_taskScores.isEmpty) return "0.00";
    double average = _taskScores.map((e) => e.score).reduce((a, b) => a + b) /
        _taskScores.length;
    return average.toStringAsFixed(2);
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

