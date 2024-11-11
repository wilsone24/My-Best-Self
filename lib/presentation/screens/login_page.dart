import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_best_self/presentation/controllers/user_controller.dart';
import 'package:my_best_self/core/utils/colors.dart';
import 'package:my_best_self/presentation/widgets/buttons/custom_button.dart';

class LoginPage extends StatelessWidget {
  final UserController userController =
      Get.find(); // Asegúrate de que esté inicializado
  final TextEditingController textController = TextEditingController();
  final RxString errorMessage = ''.obs;

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print('Inicio el login');
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.4,
            ),
            const Text('Enter your name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 242, 241, 241),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  suffixIcon: const Icon(Icons.login, color: primaryColor),
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(color: Colors.red)),
                  labelText: 'Input Name',
                ),
              ),
            ),
            Obx(() => Text(
                  errorMessage.value,
                  style: const TextStyle(color: Colors.red),
                )),
            CustomButton(
              text: "Login",
              onPressed: () {
                String name = textController.text.trim();

                if (name.isEmpty) {
                  errorMessage.value = 'Please, enter a name';
                } else if (!_isValidName(name)) {
                  errorMessage.value = 'The name must only contain letters';
                } else {
                  errorMessage.value = '';
                  userController
                      .setUserName(name); // Solo una llamada a setUserName
                  Get.toNamed(
                      '/mainpage'); // Asegúrate de que la ruta esté definida como '/mainpage'
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidName(String name) {
    final validNamePattern = RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$');
    return validNamePattern.hasMatch(name);
  }
}
