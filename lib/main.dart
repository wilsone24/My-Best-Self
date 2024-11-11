import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/core/dependency_injection.dart';
import 'package:my_best_self/data/models/data_db.dart';
import 'package:my_best_self/presentation/controllers/date_task_controller.dart';
import 'package:my_best_self/presentation/controllers/id_controller.dart';
import 'package:my_best_self/routes/app_routes.dart';
// import 'package:my_best_self/core/utils/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<List<Box>> _openBox() async {
  List<Box> boxlist = [];
  await Hive.initFlutter();
  Hive.registerAdapter(DataDbAdapter());
  boxlist.add(await Hive.openBox<DataDb>('Task'));
  return boxlist;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Abre las cajas y guarda la lista de cajas
  List<Box> boxlist = await _openBox();

  // Inicializa las dependencias de otros controladores
  DependencyInjection.init();

  // Pasa el primer elemento de `boxlist` como `taskBox` al controlador
  Get.put(DateTaskController(
      taskBox: boxlist[0]
          as Box<DataDb>)); // Usar boxlist[0] si 'Task' es la primera caja
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/loginpage',
      getPages: AppRoutes.routes, // Rutas de la aplicación
    );
  }
}
