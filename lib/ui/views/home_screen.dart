import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/widgets/home_scren/home_header.dart';
import 'package:my_best_self/ui/widgets/home_scren/todo_list.dart';
class HomeScreen extends StatelessWidget {
  final UserController userController = Get.find();
  final DateTaskController dateController = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeHeader(screenHeight: screenHeight, userController: userController),
        Expanded( // Usa Expanded para ajustar el contenido restante
          child: Obx(() {
            final tasks = dateController.tasksByDayAndMonth[
                    '${dateController.selectedMonth.value}-${dateController.selectedDay.value}'] ?? [];

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TodoList(
                  task: tasks[index],
                  index: index,
                );
              },
            );
          }),
        ),
      ],
    );
  }
}