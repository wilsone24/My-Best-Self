import 'package:hive/hive.dart';
import 'package:my_best_self/data/domain/entities/task.dart';

part 'task_hive.g.dart';

@HiveType(typeId: 0)
class TaskHive extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  int count;

  @HiveField(2)
  final int goal;

  @HiveField(3)
  final String nameGoal;

  @HiveField(4)
  final String points;

  @HiveField(5)
  bool isCompleted;

  @HiveField(6)
  final String image;

  @HiveField(7)
  final int id;

  @HiveField(8)
  final String date;

  TaskHive({
    required this.name,
    required this.count,
    required this.goal,
    required this.nameGoal,
    this.points = "",
    this.isCompleted = false,
    this.image = "assets/images/Task.png",
    required this.id,
    required this.date,
  });

  Task toTask() {
    return Task(
      name: name,
      count: count,
      goal: goal,
      nameGoal: nameGoal,
      points: points,
      isCompleted: isCompleted,
      image: image,
      id: id,
      date: date,
    );
  }

  factory TaskHive.fromTask({
    required Task task,
  }) {
    return TaskHive(
      name: task.name,
      count: task.count,
      goal: task.goal,
      nameGoal: task.nameGoal,
      points: task.points,
      isCompleted: task.isCompleted,
      image: task.image,
      id: task.id,
      date: task.date,
    );
  }
}
