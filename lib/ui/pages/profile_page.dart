import 'package:flutter/material.dart';
import 'package:my_best_self/ui/utils/colors.dart';
import 'package:my_best_self/ui/widgets/custom_button.dart';
import 'package:my_best_self/ui/pages/login_page.dart'; // Importa LoginPage

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.name}); // Agregamos el parámetro name

  final String name; // Variable para almacenar el nombre del usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Añadido SingleChildScrollView
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 260,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Center( // Cambiamos a Center sin const para poder usar el nombre
                  child: Text(
                    "Hi $name!", // Aquí mostramos el nombre del usuario
                    style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 25, top: 40, end: 25, bottom: 15, // Ajuste del padding superior
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 25, end: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "21/09/2024",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17,
                                ),
                              ),
                              Text(
                                "Total points",
                                style: TextStyle(
                                  color: Colors.grey[600], fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "100",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: primarycolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset("assets/profile.png", height: 70, width: 70),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Ajuste de padding
              child: SizedBox(
                width: double.infinity, // O puedes definir un ancho fijo
                child: CustomButton(
                  text: "Logout",
                  onPressed: () {
                    // Navegar de regreso a la pantalla de login
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  textStyle: const TextStyle(
                    fontSize: 16, // Tamaño del texto ajustado
                    color: Colors.white, // Color del texto (ajústalo según sea necesario)
                  ),
                  buttonStyle: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primarycolor, // Color de fondo
                    minimumSize: const Size(double.infinity, 50), // Ajusta la altura del botón
                    padding: const EdgeInsets.symmetric(vertical: 15), // Ajusta el padding interno
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
