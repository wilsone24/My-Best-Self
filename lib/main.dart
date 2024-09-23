import 'package:flutter/material.dart';
import 'package:my_best_self/ui/navbar/navbar.dart';
/* import 'package:my_best_self/ui/pages/login_page.dart'; */

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
      home: const MyHomePage(),
    );
  }
}