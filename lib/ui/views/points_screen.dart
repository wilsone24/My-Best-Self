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
    double screenHeight = MediaQuery.of(context).size.height;
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
              final int pointsInLevel = points % necessaryPoints;
              final int pointsNeededForNextLevel = necessaryPoints -
                  pointsInLevel; // Progreso en el nivel actual

              return Column(
                children: [
                  // Título que muestra el nivel
                  Text(
                    "Level $currentLevel",
                    style: TextStyle(
                        fontSize: screenHeight * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight * 0.03), // Espaciado
                  CircularPercentIndicator(
                    animation: true,
                    animationDuration: 1000,
                    radius: screenHeight * 0.2,
                    lineWidth: screenHeight * 0.045,
                    percent: pointsInLevel /
                        necessaryPoints, // Usamos los puntos dentro del nivel
                    progressColor: primaryColor,
                    backgroundColor: primaryColor.withOpacity(0.2),
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      "${((pointsInLevel / necessaryPoints) * 100).toStringAsFixed(0)}%",
                      style: TextStyle(fontSize: screenHeight * 0.065),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 215, 0), // Dorado claro
                          Color.fromARGB(255, 212, 175, 55), // Dorado oscuro
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
                      "400 Points per level",
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Color del texto
                      ),
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
                lineHeight: screenHeight * 0.05,
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
