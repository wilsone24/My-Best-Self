import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/widgets/custom_button.dart';

class BoolTaskPage extends StatelessWidget {
  BoolTaskPage({super.key});
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskNameGoalController = TextEditingController();
  final DateTaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
                      String goal = "1";
                      String nameGoal = taskNameGoalController.text.trim();
        
                      if (taskName.isNotEmpty &&
                          goal.isNotEmpty &&
                          nameGoal.isNotEmpty) {
                        controller.addTaskForSelectedDay(
                            taskName, goal, nameGoal);
                        taskNameController.clear();
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