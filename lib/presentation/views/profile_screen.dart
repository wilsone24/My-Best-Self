import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/core/utils/colors.dart';
import 'package:my_best_self/presentation/controllers/date_controller.dart';
import 'package:my_best_self/presentation/controllers/date_task_controller.dart';
import 'package:my_best_self/presentation/controllers/user_controller.dart';
import 'package:my_best_self/presentation/widgets/buttons/custom_button.dart';
import 'package:my_best_self/presentation/widgets/profile_screen/profile_header.dart';
import 'package:my_best_self/presentation/widgets/profile_screen/profile_photo.dart';
import 'package:my_best_self/presentation/widgets/profile_screen/profile_points.dart';

class ProfileScreen extends StatelessWidget {
  final DateController dateController = Get.find();
  final DateTaskController dateTaskController = Get.find();
  final UserController userController = Get.find();

  ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidght = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ProfileHeader(
            screenHeight: screenHeight, userController: userController),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenHeight * 0.025,
              top: screenHeight * 0.03,
              end: screenHeight * 0.025,
              bottom: screenHeight * 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfilePoints(
                  screenHeight: screenHeight,
                  screenWidght: screenWidght,
                  dateController: dateController,
                  dateTaskController: dateTaskController),
              ProfilePhoto(
                  screenHeight: screenHeight, screenWidght: screenWidght),
            ],
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              CustomButton(
                key: const Key('LogoutAccount'),
                text: "Logout",
                onPressed: () {
                  Get.toNamed('/loginpage/');
                },
                color: primaryColor,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomButton(
                text: "Erase data",
                onPressed: () {
                  dateTaskController.removeAll();
                  Get.toNamed('/loginpage/');
                },
                color: const Color.fromARGB(255, 157, 41, 51),
              )
            ],
          ),
        ),
      ],
    );
  }
}
