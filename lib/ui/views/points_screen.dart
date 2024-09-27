import 'package:flutter/material.dart';
import 'package:my_best_self/ui/utils/colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});
  final int points = 40; 
  final int necessaryPoints = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircularPercentIndicator(
              animation: true,
              animationDuration: 1000,
              radius: 200,
              lineWidth: 40,
              percent: points/necessaryPoints,
              progressColor: primaryColor,
              backgroundColor: primaryColor.withOpacity(0.2),
              circularStrokeCap: CircularStrokeCap.round,
              center:  Text(
                "${((points / necessaryPoints)*100).toStringAsFixed(0)}%",
                style: const TextStyle(fontSize: 50),
              ),
            ),
            LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 40,
              percent: points/necessaryPoints,
              progressColor: primaryColor,
              backgroundColor: primaryColor.withOpacity(0.2),
              barRadius: const Radius.circular(50),
            )
          ],
        ),
      ),
    );
  }
}