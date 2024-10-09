import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/routes/app_routes.dart'; // Importa las rutas
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/controllers/id_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/utils/colors.dart';

void main() {
  Get.put(DateController());
  Get.put(UserController());
  Get.put(DateTaskController());
  Get.put(IdController());
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
      getPages: AppRoutes.routes, // Usamos las rutas desde app_routes.dart
    );
  }
}
