import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'data_db.g.dart';

@HiveType(typeId: 0)
class DataDb extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  RxInt count = 0.obs; // Cambiar a RxInt

  @HiveField(3)
  int goal;

  @HiveField(4)
  String nameGoal;

  @HiveField(5)
  String points;

  @HiveField(6)
  RxBool isCompleted = false.obs; // Cambiar a RxBool

  @HiveField(7)
  String image;

  @HiveField(8)
  DateTime date;

  DataDb({
    this.id,
    required this.name,
    required this.goal,
    required this.nameGoal,
    this.points = "",
    this.image = "assets/images/Task.png",
    required this.date,
  });
}
