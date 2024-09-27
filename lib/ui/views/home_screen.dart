import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/models/task.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/todo_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/widgets/home_scren/home_header.dart';
import 'package:my_best_self/ui/widgets/home_scren/todo_list.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.find();
  final TodoController todoController = Get.find();
  final DateController dateController = Get.find();
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskGoalController = TextEditingController();
  final TextEditingController taskNameGoalController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        HomeHeader(screenHeight: screenHeight, userController: userController),
        SizedBox(height: screenHeight * 0.02),
        Expanded(
          child: GetX<TodoController>(
            builder: (todoController) {
              return Column(
                children: [
                  // Eliminamos el Expanded que rodea al ListView.builder
                  Flexible(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20), // Reducimos el padding para acercar el ListView
                      shrinkWrap: true, // Esto ajusta el ListView a su contenido
                      itemCount: todoController.toDoList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TodoList(
                          task: todoController.toDoList[index],
                          index: index,
                        );
                      },
                    ),
                  ),
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
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      String taskName = taskNameController.text.trim();
                      String goal = taskGoalController.text.trim();
                      String nameGoal = taskNameGoalController.text.trim();

                      if (taskName.isNotEmpty &&
                          goal.isNotEmpty &&
                          nameGoal.isNotEmpty) {
                        Task newTask = Task(
                          name: taskName,
                          goal: int.tryParse(goal) ?? 0,
                          nameGoal: nameGoal,
                        );
                        todoController.addTodo(newTask);
                        taskNameController.clear();
                        taskGoalController.clear();
                        taskNameGoalController.clear();
                      } else {
                        Get.snackbar(
                          "Error",
                          "Por favor, completa todos los campos",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    child: const Text("Add Todo"),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
