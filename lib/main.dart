import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/controllers/todo_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/screens/bool_task_page.dart';
import 'package:my_best_self/ui/screens/main_page.dart';
import 'package:my_best_self/ui/screens/login_page.dart';
import 'package:my_best_self/ui/screens/quan_task_page.dart';
import 'package:my_best_self/ui/utils/colors.dart';

void main() {
  Get.put(DateController());
  Get.put(TodoController());
  Get.put(UserController());
  Get.put(DateTaskController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Best Self',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: bodyColor),
        useMaterial3: true,
      ),
      initialRoute: '/loginpage',
      getPages: [
        GetPage(name: '/loginpage', page: () => LoginPage()),
        GetPage(name: '/mainpage', page: () => const Mainpage()),
        GetPage(name: '/booltaskpage', page: () => BoolTaskPage()),
        GetPage(name: '/quantaskpage', page: () => QuanTaskPage()),
      ],
    );
  }
}
