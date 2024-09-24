import 'package:flutter/material.dart';
import 'package:my_best_self/ui/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed, required ButtonStyle buttonStyle, required TextStyle textStyle});
  
  final String text;
  final VoidCallback onPressed; // Modificado para aceptar un callback

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 115),
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: onPressed, // Llama a la función pasada como argumento
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(primarycolor),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 9),
              child: Text(
                text,
                style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}