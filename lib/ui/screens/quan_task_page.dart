import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/widgets/buttons/custom_button.dart';
class QuanTaskPage extends StatelessWidget {
  QuanTaskPage({super.key});
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskGoalController = TextEditingController();
  final TextEditingController taskNameGoalController = TextEditingController();
  final TextEditingController taskImageController = TextEditingController();
  final DateTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final Map<String, dynamic>? arguments =
        Get.arguments as Map<String, dynamic>?;
    if (arguments != null) {
      // Asignar valores a los controladores desde el mapa de argumentos
      taskNameController.text = arguments['taskName'] ?? '';
      taskNameGoalController.text = arguments['taskDescription'] ?? '';
      String image = arguments['image'] ?? 'assets/images/Task.png';
      taskImageController.text = arguments['image'] ?? 'assets/images/Task.png';
    }
    return Scaffold(
      body: SingleChildScrollView(
        // Añadir SingleChildScrollView aquí
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
                            controller: taskGoalController,
                            decoration: const InputDecoration(
                              labelText: "Goal",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
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
                    onPressed: () {
                      String taskName = taskNameController.text.trim();
                      String goal = taskGoalController.text.trim();
                      String nameGoal = taskNameGoalController.text.trim();
                      String image = taskImageController.text.trim();

                      if (taskName.isNotEmpty &&
                          goal.isNotEmpty &&
                          nameGoal.isNotEmpty) {
                        controller.addTaskForSelectedDay(
                            taskName, goal, nameGoal,image);
                        taskNameController.clear();
                        taskGoalController.clear();
                        taskNameGoalController.clear();
                        Get.toNamed('/mainpage/');
                      } else {
                        Get.snackbar(
                          "Error",
                          "Por favor, completa todos los campos",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    text: "Add Todo",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
