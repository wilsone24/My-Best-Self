import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/ui/controllers/user_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.screenHeight,
    required this.userController,
  });

  final double screenHeight;
  final UserController userController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Column(
                children: [
                  const Center(
                      child: Text(
                    "Today",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  )),
                  Center(
                      child: Obx(() => Text(
                            "Hi ${userController.userName}!",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )))
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  Center(child: Text("Fecha")),
                  Center(child: Text("Cards")),
                ],
              ),
            ],
          )),
    );
  }
}
