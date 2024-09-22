import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';

class Homepage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final DateController dateController = Get.put(DateController());
  final TaskController taskController = Get.put(TaskController());

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Tareas')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Text(
                      dateController.getCurrentDate(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Text(
                      "Hi ${userController.getUserName()}!",
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
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
      ),
    );
  }
}
