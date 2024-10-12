import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/core/dependency_injection.dart';
import 'package:my_best_self/routes/app_routes.dart';
import 'package:my_best_self/core/utils/colors.dart';

void main() {
  DependencyInjection.init();
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
      getPages: AppRoutes.routes, // Rutas centralizadas
    );
  }
}