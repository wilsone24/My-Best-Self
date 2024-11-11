import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/domain/entities/task.dart';
import 'package:my_best_self/presentation/controllers/date_task_controller.dart';
import 'package:my_best_self/core/utils/colors.dart'; // Asegúrate de importar GetX

class HabitTask extends StatelessWidget {
  const HabitTask({
    super.key,
    required this.task,
    required this.index,
  });

  final Task task; // Recibe la tarea.
  final int index; // Índice de la tarea en la lista.

  @override
  Widget build(BuildContext context) {
    final DateTaskController datetaskcontroller = Get.find();
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        top: 0,
        left: screenHeight * 0.038,
        right: screenHeight * 0.038,
        bottom: screenHeight * 0.025,
      ),
      child: Obx(() {
        // Verifica si la tarea está completa
        return AnimatedContainer(
          duration: const Duration(
              milliseconds: 500), // Animación para cambio de color
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: task.isCompleted.value
                  ? const Color.fromARGB(
                      255, 243, 243, 243) // Color cuando la tarea está completa
                  : Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3) // cambios
                    )
              ] // Color cuando la tarea no está completa
              ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Image.asset(task.image, height: 40, width: 40),
                      ),
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
                                    : Colors.black,
                                fontWeight: FontWeight
                                    .bold // Color normal si no está completa
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
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      if (task.isCompleted.value)
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(
                                    255, 255, 215, 0), // Dorado claro
                                Color.fromARGB(
                                    255, 212, 175, 55), // Dorado oscuro
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius:
                                BorderRadius.circular(5), // Bordes redondeados
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8), // Espacio interno
                          child: Text(
                            "${task.points} Points",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Color del texto
                            ),
                          ),
                        ),
                      Row(
                        children: [
                          IconButton(
                            // Botón para incrementar el contador
                            icon: const Icon(
                              Icons.add,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              datetaskcontroller.incrementTaskCount(
                                  index); // Incrementa el contador.
                            },
                          ),
                          IconButton(
                            // Botón para eliminar la tarea
                            icon: const Icon(
                              Icons.delete_outline_rounded,
                              color: primaryColor,
                            ),
                            onPressed: () {
                              datetaskcontroller
                                  .removeTask(task.id!); // Elimina la tarea.
                            },
                          ),
                        ],
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
