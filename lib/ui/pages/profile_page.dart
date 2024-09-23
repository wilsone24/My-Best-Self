import 'package:flutter/material.dart';
import 'package:my_best_self/ui/utils/colors.dart';
import 'package:my_best_self/ui/widgets/custom_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SafeArea(
          child: Container(
              width: double.infinity,
              height: 260,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: const Center(
                  child: Text(
                "Hi Wilson!",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
              ))),
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
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 25, end: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "21/09/2024",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text("Total points",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 17)),
                          ],
                        ),
                        const Text(
                          "100",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: primarycolor),
                        )
                      ],
                    ),
                  )),
              Image.asset("assets/profile.png", height: 148, width: 148),
            ],
          ),
        ),
        const SafeArea(child: CustomButton(text: "Logout")),
      ],
    );
  }
}
