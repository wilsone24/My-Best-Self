import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/todo_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/widgets/home_scren/home_header.dart';
import 'package:my_best_self/ui/widgets/home_scren/todo_list.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.find();
  final DateController dateController = Get.find();


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
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
