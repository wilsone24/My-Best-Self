import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:loggy/loggy.dart';
import 'package:my_best_self/core/dependency_injection.dart';
import 'package:my_best_self/data/domain/entities/task_hive.dart';
import 'package:my_best_self/routes/app_routes.dart';
import 'package:my_best_self/core/utils/colors.dart';

Future<List<Box>> _openBox() async {
  List<Box> boxList = [];
  await Hive.initFlutter();
  Hive.registerAdapter(TaskHiveAdapter());
  boxList.add(await Hive.openBox("todos"));
  return boxList;
}

void main() async {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await _openBox();
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
