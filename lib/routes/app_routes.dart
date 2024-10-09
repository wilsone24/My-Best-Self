import 'package:get/get.dart';
import 'package:my_best_self/ui/screens/bool_task_page.dart';
import 'package:my_best_self/ui/screens/login_page.dart';
import 'package:my_best_self/ui/screens/main_page.dart';
import 'package:my_best_self/ui/screens/quan_task_page.dart';
import 'package:my_best_self/ui/screens/template_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/loginpage', page: () => LoginPage()),
    GetPage(name: '/mainpage', page: () => const Mainpage()),
    GetPage(name: '/booltaskpage', page: () => BoolTaskPage()),
    GetPage(name: '/quantaskpage', page: () => QuanTaskPage()),
    GetPage(name: '/templatepage', page: () => const TemplatePage()),
  ];
}
