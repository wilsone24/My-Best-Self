import 'package:get/get.dart';
import 'package:my_best_self/presentation/controllers/date_controller.dart';
import 'package:my_best_self/presentation/controllers/date_task_controller.dart';
import 'package:my_best_self/presentation/controllers/id_controller.dart';
import 'package:my_best_self/presentation/controllers/user_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put(DateController());
    Get.put(UserController());
    Get.put(DateTaskController());
    Get.put(IdController());
  }
}
