import 'package:flutter/material.dart';
import 'package:my_best_self/ui/navbar/navbar.dart';
import 'package:my_best_self/ui/pages/login_page.dart';
import 'package:my_best_self/ui/pages/profile_page.dart' as profile;
import 'package:my_best_self/ui/pages/gamification_page.dart' as gamification;

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
      const Center(child: Text('Gamification Page')), // Aquí puedes poner tu GamificationPage real
      const Center(child: Text('Add Content Page')),
      const Center(child: Text('Analytics Page')),
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