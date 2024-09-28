import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/widgets/home_scren/home_header2.dart';

class HomeScreen2 extends StatelessWidget {
  final UserController userController = Get.find();
  final DateTaskController dateController = Get.find();
  final DateTaskController controller = Get.find();

  HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min, // Ajuste aquí
      children: [
        HomeHeader2(screenHeight: screenHeight, userController: userController),
        Obx(() {
                  final tasks = controller.tasksByDayAndMonth[
                          '${controller.selectedMonth.value}-${controller.selectedDay.value}'] ??
                      [];

                  return SizedBox(
                    height: screenHeight * 0.4, // Ajuste de altura
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return tasks[index];
                      },
                    ),
                  );
                }),
                // Botón para agregar una tarea
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.addTaskForSelectedDay();
                    },
                    child: const Text('Agregar tarea (Card)'),
                  ),
                ),
      ],
    );
  }
}

