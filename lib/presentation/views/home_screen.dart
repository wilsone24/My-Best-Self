import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/presentation/controllers/date_task_controller.dart';
import 'package:my_best_self/presentation/controllers/user_controller.dart';
import 'package:my_best_self/presentation/widgets/home_scren/home_header.dart';
import 'package:my_best_self/presentation/widgets/home_scren/habit_task.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: const Key('Homepage'));
  final UserController userController = Get.find();
  final DateTaskController dateController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeHeader(screenHeight: screenHeight, userController: userController),
        Expanded(
          // Usa Expanded para ajustar el contenido restante
          child: Obx(() {
            final tasks = dateController.tasksByDayAndMonth[
                    '${dateController.selectedMonth.value}-${dateController.selectedDay.value}'] ??
                [];

            return ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return HabitTask(
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
