import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/date_task_controller.dart';
import 'package:my_best_self/ui/controllers/todo_controller.dart';
import 'package:my_best_self/ui/utils/colors.dart';

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
        padding: const EdgeInsetsDirectional.only(start: 25, end: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(
                      dateController.getCurrentDate(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    )),
                Text("Total points",
                    style:
                        TextStyle(color: Colors.blueGrey[600], fontSize: 17)),
              ],
            ),
            Obx(() => Text(
                  "${dateTaskController.calculateCompletedPoints()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: primaryColor),
                ))
          ],
        ),
      ),
    );
  }
}
