import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/date_controller.dart';
import 'package:my_best_self/ui/controllers/task_controller.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';
import 'package:my_best_self/ui/utils/colors.dart';
import 'package:my_best_self/ui/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  final DateController dateController = Get.put(DateController());
  final TaskController taskController = Get.put(TaskController());
  final UserController userController = Get.put(UserController());

  ProfilePage({super.key});

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
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3) // changes
                        )
                  ]),
              child: Center(
                child: Text(
                  "Hi ${userController.getUserName()}!",
                  style: const TextStyle(
                      fontSize: 45, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 25, top: 140, end: 25, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    padding:
                        const EdgeInsetsDirectional.only(start: 25, end: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dateController.getCurrentDate(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text("Total points",
                                style: TextStyle(
                                    color: Colors.blueGrey[600], fontSize: 17)),
                          ],
                        ),
                        Text(
                          taskController.getGlobalAverageScore(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: primarycolor),
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset("assets/profile.png", height: 148, width: 148),
              ],
            ),
          ),
          SafeArea(
            child: CustomButton(
              text: "Logout",
              onPressed: () {
                Get.toNamed('/loginpage/');
              },
            ),
          ),
        ],
      ),
    );
  }
}
