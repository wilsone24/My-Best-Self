import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({
    super.key,
    required this.screenHeight,
    required this.screenWidght,
  });

  final double screenHeight;
  final double screenWidght;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/profile.png",
        height: screenHeight * 0.32, width: screenWidght * 0.32);
  }
}
