import 'package:flutter/material.dart';
import 'package:my_best_self/ui/utils/colors.dart'; // Asegúrate de importar tus colores

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white, // Color de fondo del BottomNavBar
      elevation: 8,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, 'Home', Icons.home),
            _buildNavItem(1, 'Profile', Icons.person_outline),
            _buildCenterButton(),
            _buildNavItem(3, 'Game', Icons.sports_gymnastics_outlined),
            _buildNavItem(4, 'Settings', Icons.settings),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData icon) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: isSelected
            ? Matrix4.diagonal3Values(1.1, 1.1, 1.0)
            : Matrix4.identity(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? primarycolor : Colors.grey, // Usa primarycolor
              size: 28,
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isSelected ? primarycolor : Colors.grey, // Usa primarycolor
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    return GestureDetector(
      onTap: () => onItemTapped(2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 66,
        height: 66,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [primarycolor, primarycolor.withOpacity(0.7)], // Usa la paleta de colores
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}