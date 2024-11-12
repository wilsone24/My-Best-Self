class Task {
  late String name;
  late int count; // Cambiar a RxInt
  late int goal;
  late String nameGoal;
  late String points;
  late bool isCompleted; // Cambiar a RxBool
  late String image;
  late int id;
  late String date;

  Task({
    required this.name,
    required this.count,
    required this.goal,
    required this.nameGoal,
    required this.points,
    required this.isCompleted,
    this.image = "assets/images/Task.png",
    required this.id,
    required this.date,
  });

  Task.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    count = map['count'];
    goal = map['goal'];
    nameGoal = map['nameGoal'];
    points = map['points'];
    isCompleted = map['isCompleted'];
    image = map['image'];
    id = map['id'];
    date = map['date'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'count': count,
      'goal': goal,
      'nameGoal': nameGoal,
      'points': points,
      'isCompleted': isCompleted,
      'image': image,
      'id': id,
      'date': date,
    };
    return map;
  }

  void incrementCount() {
    if (count < goal) {
      count++; // Aumentar el valor usando .value
    }
    if (count == goal) {
      isCompleted = true; // Cambiar a true
    }
  }
}
