import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/core/utils/colors.dart';
import 'package:my_best_self/presentation/controllers/date_task_controller.dart';
import 'package:my_best_self/presentation/controllers/id_controller.dart';
import 'package:my_best_self/presentation/widgets/buttons/custom_button.dart';

class BoolTaskPage extends StatelessWidget {
  BoolTaskPage({super.key});
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskNameGoalController = TextEditingController();
  final TextEditingController taskImageController = TextEditingController();
  final DateTaskController controller = Get.find();
  final IdController idController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    taskImageController.text = 'assets/images/Task.png';
    final Map<String, dynamic>? arguments =
        Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      taskNameController.text = arguments['taskName'] ?? '';
      taskNameGoalController.text = arguments['taskDescription'] ?? '';
      taskImageController.text = arguments['image'] ?? 'assets/images/Task.png';
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.4,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      key: const Key("nameTaskBoolean"),
                      controller: taskNameController,
                      decoration: const InputDecoration(
                        labelText: "Escribe el nombre de la tarea",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            key: const Key('nameGoal'),
                            controller: taskNameGoalController,
                            decoration: const InputDecoration(
                              labelText: "Name Goal",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomButton(
                    key: const Key('CreateTask'),
                    onPressed: () {
                      String taskName = taskNameController.text.trim();
                      String goal = "1";
                      String nameGoal = taskNameGoalController.text.trim();
                      String image = taskImageController.text.trim();
                      int id = idController.id;

                      if (taskName.isEmpty ||
                          goal.isEmpty ||
                          nameGoal.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Por favor, completa todos los campos",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else if (!_isText(taskName)) {
                        Get.snackbar(
                          "Error",
                          "Por favor, ingresa un nombre correcto",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else if (!_isText(nameGoal)) {
                        Get.snackbar(
                          "Error",
                          "Por favor, ingresa un nombre de meta correcto",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        controller.addTaskForSelectedDay(
                            taskName, goal, nameGoal, image, id);
                        taskNameController.clear();
                        taskNameGoalController.clear();
                        taskImageController.clear();
                        idController.increment();
                        Get.toNamed('/mainpage/');
                      }
                    },
                    text: "Add Todo",
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isText(String name) {
    final validNamePattern = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$');
    return validNamePattern.hasMatch(name);
  }
}
