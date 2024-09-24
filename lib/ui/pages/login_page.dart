import 'package:flutter/material.dart';
import 'package:my_best_self/ui/pages/homepage.dart';
// Importa ProfilePage
import 'package:my_best_self/ui/widgets/custom_button.dart';
import 'package:my_best_self/ui/utils/colors.dart';
// Importa HomePage

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(); // Controlador para el campo de texto

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 400),
          const Text(
            'Enter your name',
            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextField(
              controller: nameController, // Asigna el controlador al campo de texto
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 242, 241, 241),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: const Icon(Icons.login, color: primarycolor),
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                labelText: 'Input Name',
              ),
            ),
          ),
          CustomButton(
            text: "Login",
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isNotEmpty) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(name: name), // Navega a HomePage pasando el nombre
                  ),
                );
              } else {
                // Manejo de error para nombre vacío
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter your name')),
                );
              }
            },
            buttonStyle: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: primarycolor, // Set the text color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ), textStyle: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}