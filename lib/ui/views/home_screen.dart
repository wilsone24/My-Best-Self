import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/widgets/home_scren/home_header.dart';
import 'package:my_best_self/ui/widgets/home_scren/todo_list.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.find();
  final DateTaskController dateController = Get.find();
  final DateTaskController controller = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min, // Ajuste aquí
      children: [
        HomeHeader(screenHeight: screenHeight, userController: userController),
        Obx(() {
          final tasks = controller.tasksByDayAndMonth[
                  '${controller.selectedMonth.value}-${controller.selectedDay.value}'] ??
              [];

          return SizedBox(
            height: screenHeight * 0.6, // Ajuste de altura
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TodoList(
                          task: tasks[index],
                          index: index,
                        );
              },
            ),
          );
        }),
      ],
    );
  }
}