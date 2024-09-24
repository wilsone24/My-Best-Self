import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/views/home_screen.dart';

class Mainpage extends StatelessWidget {
  final UserController userController = Get.find();
  final TaskController taskController = Get.find();
  final DateController dateController = Get.find();

  Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}