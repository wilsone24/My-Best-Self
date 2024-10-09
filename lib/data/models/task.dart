import 'package:get/get.dart';

class Task {
  final String name;
  final RxInt count = 0.obs; // Cambiar a RxInt
  final int goal;
  final String nameGoal;
  final String points;
  final RxBool isCompleted = false.obs; // Cambiar a RxBool
  final String image;
  final int id;

  Task({
    required this.name,
    required this.goal,
    required this.nameGoal,
    this.points = "",
    this.image = "assets/images/Task.png",
    required this.id,
  });

  void incrementCount() {
    if (count < goal) {
      count.value++; // Aumentar el valor usando .value
    }
    if (count.value == goal) {
      isCompleted.value = true; // Cambiar a true
    }
  }
}
