import 'package:flutter/material.dart';
import 'package:my_best_self/ui/navbar/navbar.dart'; // Asegúrate de que el CustomBottomNavBar esté en esta ruta
import 'package:my_best_self/ui/pages/login_page.dart';
import 'package:my_best_self/ui/pages/profile_page.dart' as profile;
import 'package:my_best_self/ui/widgets/custom_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF74B7BB)),
        useMaterial3: true,
      ),
      home: const LoginPage(), // Pantalla de Login al inicio
    );
  }
}

class HomePage extends StatefulWidget {
  final String name; // Agrega un parámetro para recibir el nombre

  const HomePage({super.key, required this.name}); // Constructor modificado

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Lista de widgets para el cuerpo del Scaffold
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Inicializa las páginas, pasando el nombre al ProfilePage
    _pages = [
      profile.ProfilePage(name: widget.name), // Pasa el nombre aquí
      const Center(child: Text('Second Page')), // Placeholder para la segunda página
      const Center(child: Text('Add Content Page')), // Placeholder para la página que se muestra al presionar +
      const Center(child: Text('Analytics Page')), // Placeholder para la cuarta página
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: _pages[_selectedIndex], // Intercambia entre las vistas aquí
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

// Página de perfil
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
                              color: Colors.black45,
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
                    backgroundColor: Colors.black45, // Color de fondo
                    minimumSize: const Size(double.infinity, 50), // Ajusta la altura del botón
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Ajusta el padding interno
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