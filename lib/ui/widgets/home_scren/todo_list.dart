import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/models/task.dart';
import 'package:my_best_self/ui/controllers/todo_controller.dart';
import 'package:my_best_self/ui/utils/colors.dart'; // Asegúrate de importar GetX

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.task,
    required this.index,
  });

  final Task task; // Recibe la tarea.
  final int index; // Índice de la tarea en la lista.

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.find();

    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 35,
        right: 35,
        bottom: 0,
      ),
      child: Obx(() {
        // Verifica si la tarea está completa

        return AnimatedContainer(
          duration: const Duration(
              milliseconds: 500), // Animación para cambio de color
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: task.isCompleted.value
                ? const Color.fromARGB(255, 243, 243, 243) // Color cuando la tarea está completa
                : Colors.white // Color cuando la tarea no está completa
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Texto de la tarea con tachado si está completada
                      Text(
                        task.name,
                        style: TextStyle(
                          fontSize: 17,
                          decoration: task.isCompleted.value
                              ? TextDecoration
                                  .lineThrough // Tachar el texto si está completa
                              : TextDecoration.none,
                          color: task.isCompleted.value
                              ? Colors
                                  .black // Color gris si está completa
                              : Colors
                                  .black,
                          fontWeight: FontWeight.bold // Color normal si no está completa
                        ),
                      ),
                      Obx(
                        () => Text(
                          "${task.count.value} / ${task.goal} ${task.nameGoal}",
                          style: TextStyle(
                            fontSize: 16,
                            decoration: task.isCompleted.value
                                ? TextDecoration
                                    .lineThrough // Tachar si está completa
                                : TextDecoration.none,
                            color: task.isCompleted.value
                                ? Colors.grey
                                : dayTextCardColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        // Botón para incrementar el contador
                        icon: const Icon(Icons.add, color: primaryColor,),
                        onPressed: () {
                          todoController.incrementTaskCount(
                              index); // Incrementa el contador.
                        },
                      ),
                      IconButton(
                        // Botón para eliminar la tarea
                        icon: const Icon(Icons.delete_outline_rounded,color: primaryColor,),
                        onPressed: () {
                          todoController.removeTask(task); // Elimina la tarea.
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                  height: 10), // Espacio antes de la barra de progreso.
              Obx(() {
                double progress =
                    task.count.value / task.goal; // Calcula el progreso.
                return LinearProgressIndicator(
                  value: progress, // Valor de progreso entre 0 y 1.
                  backgroundColor: Colors.grey.shade300, // Color de fondo.
                  color: primaryColor, // Color de la barra de progreso.
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
