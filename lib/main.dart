import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/screens/task_page.dart';
import 'package:my_best_self/ui/screens/template_page.dart';
import 'package:my_best_self/ui/views/homepage.dart';
import 'package:my_best_self/ui/screens/login_page.dart';
import 'package:my_best_self/ui/utils/colors.dart';
import 'package:my_best_self/ui/views/profile_page.dart';
/* import 'package:my_best_self/ui/pages/login_page.dart'; */

void main() {
  Get.put(DateController());
  Get.put(TaskController());
  Get.put(UserController());
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
        colorScheme: ColorScheme.fromSeed(seedColor: bodycolor),
        useMaterial3: true,
      ),
      initialRoute: '/loginpage',
      getPages: [
        GetPage(name: '/loginpage', page: () => LoginPage()),
        GetPage(name: '/homepage', page: () => Homepage()),
        GetPage(name: '/templatepage', page: () => const TemplatePage()),
        GetPage(name: '/taskpage', page: () => const TaskPage()),
        GetPage(name: '/profilepage', page: () => ProfilePage())
      ],
    );
  }
}
