import 'package:flutter/material.dart';
import 'package:my_best_self/ui/utils/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({super.key, 
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, 'Home', Icons.home),
          _buildNavItem(1, 'Game', Icons.sports_esports),
          _buildNavItem(2, 'Profile', Icons.person),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData icon) {
    final isSelected = selectedIndex == index;
    return InkWell(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isSelected ? primarycolor : Colors.grey, size: 28),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? primarycolor : Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
