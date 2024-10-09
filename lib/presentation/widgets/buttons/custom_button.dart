import 'package:flutter/material.dart';
import 'package:my_best_self/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 115),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
              onPressed: onPressed,
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(primaryColor)),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 9),
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w500),
                ),
              )),
        ),
      ),
    );
  }
}
