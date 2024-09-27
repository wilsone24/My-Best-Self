import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/utils/colors.dart';
import 'package:my_best_self/ui/widgets/home_scren/home_header.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.find();
  final TaskController taskController = Get.find();
  final DateController dateController = Get.find();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidght = MediaQuery.of(context).size.width;
    return Column(
      children: [
        HomeHeader(screenHeight: screenHeight, userController: userController),
        Padding(
          padding: EdgeInsetsDirectional.only(top: screenHeight * 0.025),
          child: Container(
            height: screenHeight * 0.1,
            width: screenWidght * 0.75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3) // changes
                      )
                ]),
            child: const Padding(
              padding: EdgeInsetsDirectional.only(start: 25, end: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "prueba",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: primarycolor),
                      ),
                      Text(
                        "adios",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: primarycolor),
                      ),
                    ],
                  ),
                  
                  Text(
                    "Hola",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: primarycolor),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Obx(() {
            return ListView.builder(
              itemCount: taskController.taskList.length,
              itemBuilder: (context, index) {
                final task = taskController.taskList[index];
                return SizedBox(
                  height: 100,
                  child: Card(
                    child: ListTile(
                      title: Text(task.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (task.isDone != null)
                            Text('State: ${task.isDone! ? "Done" : "Pending"}'),
                          if (task.count != null)
                            Text(
                                'Times performed: ${task.count} / ${task.goal}'),
                          Text('Goals: ${task.score}'),
                          Text(
                              'Last Activity: ${task.lastActivityDate ?? "N/A"}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          taskController.deleteTask(index);
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}


