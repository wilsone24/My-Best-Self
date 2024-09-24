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
            children: [
              const Center(child: Text("Today")),
              Center(
                  child: Obx(() => Text("Hi ${userController.userName}!"))),
              const Center(child: Text("Fecha")),
              const Center(child: Text("Cards")),
            ],
          )),
    );
  }
}