import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/pages/homepage.dart';
import 'package:my_best_self/ui/pages/login_page.dart';
import 'package:my_best_self/ui/pages/profile_page.dart';
import 'package:my_best_self/ui/pages/task_page.dart';
import 'package:my_best_self/ui/pages/template_page.dart';
/* import 'package:my_best_self/ui/pages/login_page.dart'; */

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF74B7BB)),
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
