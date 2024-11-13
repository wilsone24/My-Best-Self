import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../data/domain/use_case/todo_use_case.dart';

class IdController extends GetxController {
  final _id = 0.obs;
  int get id => _id.value;
  void increment() => _id.value++;
  void setid(int newId) => _id.value = newId;

  IdController() {
    initIdValue();
  }

  TodoUseCase todoUseCase = Get.find();
  Future<void> initIdValue() async {
    logInfo("userController -> getAllUsers");
    var list = await todoUseCase.getAllTodos();
    int id = 0;
    for (var task in list) {
      if ((task.id) > id) {
        id = task.id;
      }
    }
    setid(id + 1);
    logInfo("new id value: ${id + 1}");
  }
}
