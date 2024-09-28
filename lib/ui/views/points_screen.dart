import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/utils/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GameScreen extends StatelessWidget {
  GameScreen({super.key});
  final DateTaskController dateTaskController =
      Get.find(); // Obtén el controlador
  final int necessaryPoints = 400;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(() {
              final points = dateTaskController.calculateCompletedPoints();
              final int currentLevel =
                  (points ~/ necessaryPoints) + 1; // Calcula el nivel
              final int pointsInLevel =
                  points % necessaryPoints; // Progreso en el nivel actual

              return Column(
                children: [
                  // Título que muestra el nivel
                  Text(
                    "Nivel $currentLevel",
                    style: const TextStyle(
                        fontSize: 55, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20), // Espaciado
                  CircularPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    radius: 180,
                    lineWidth: 40,
                    percent: pointsInLevel /
                        necessaryPoints, // Usamos los puntos dentro del nivel
                    progressColor: primaryColor,
                    backgroundColor: primaryColor.withOpacity(0.2),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      "${((pointsInLevel / necessaryPoints) * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ],
              );
            }),
            Obx(() {
              final points = dateTaskController.calculateCompletedPoints();
              final int pointsInLevel =
                  points % necessaryPoints; // Progreso en el nivel actual

              return LinearPercentIndicator(
                animation: true,
                animationDuration: 1000,
                lineHeight: 40,
                percent: pointsInLevel /
                    necessaryPoints, // Usamos los puntos dentro del nivel
                progressColor: primaryColor,
                backgroundColor: primaryColor.withOpacity(0.2),
                barRadius: const Radius.circular(50),
              );
            }),
          ],
        ),
      ),
    );
  }
}
