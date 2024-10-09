import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/presentation/controllers/user_controller.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Center(
          child: Obx(
            () => Text("Hi ${userController.userName}!",
                style: TextStyle(
                    fontSize: screenHeight * 0.05,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
