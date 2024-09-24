import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/utils/colors.dart';

class Homepage extends StatelessWidget {
  final UserController userController = Get.find();
  final TaskController taskController = Get.find();
  final DateController dateController = Get.find();

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Container(
                width: double.infinity,
                height: screenHeight * 0.27,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3) // changes
                      )
                ]),
                child: Column(
                  children: [
                    const Center(child: Text("Today")),
                    Center(
                        child:
                            Obx(() => Text("Hi ${userController.userName}!"))),
                    const Center(child: Text("Fecha")),
                    const Center(child: Text("Cards")),
                  ],
                )),
          ),
          Container(
            height: 80,
            width: 220,
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
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 25, end: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => Text(
                            dateController.currentDate,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )),
                      Text("Total points",
                          style: TextStyle(
                              color: Colors.blueGrey[600], fontSize: 17)),
                    ],
                  ),
                  Obx(() => Text(
                        taskController.getGlobalAverageScore(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: primarycolor),
                      ))
                ],
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
                              Text(
                                  'State: ${task.isDone! ? "Done" : "Pending"}'),
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
      ),
    );
  }
}
