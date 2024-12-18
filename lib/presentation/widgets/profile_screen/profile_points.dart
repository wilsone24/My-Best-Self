import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/presentation/controllers/date_controller.dart';
import 'package:my_best_self/presentation/controllers/date_task_controller.dart';
import 'package:my_best_self/core/utils/colors.dart';

class ProfilePoints extends StatelessWidget {
  const ProfilePoints({
    super.key,
    required this.screenHeight,
    required this.screenWidght,
    required this.dateController,
    required this.dateTaskController,
  });

  final double screenHeight;
  final double screenWidght;
  final DateController dateController;
  final DateTaskController dateTaskController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.10,
      width: screenWidght * 0.50,
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
        padding: EdgeInsetsDirectional.only(
            start: screenHeight * 0.027, end: screenHeight * 0.027),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(
                      dateController.getCurrentDate(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * 0.02),
                    )),
                Text("Total points",
                    style: TextStyle(
                        color: Colors.blueGrey[600],
                        fontSize: screenHeight * 0.021)),
              ],
            ),
            Obx(() => Text(
                  "${dateTaskController.calculateCompletedPoints()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.020,
                      color: primaryColor),
                ))
          ],
        ),
      ),
    );
  }
}
