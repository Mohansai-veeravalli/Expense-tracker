import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;

  CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: selectedIndex == 0
              ? Icon(Icons.home_filled)
              : Icon(Icons.home_outlined, color: Color.fromARGB(255, 63, 160, 153)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 1
              ? const Icon(Icons.bar_chart_sharp)
              : const Icon(Icons.bar_chart_outlined, color: Color.fromARGB(255, 63, 160, 153)),
          label: 'Expense Stats',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 2
              ? const Icon(Icons.description_sharp)
              : const Icon(Icons.description_outlined, color: Color.fromARGB(255, 63, 160, 153)),
          label: 'Reports',
        ),
        BottomNavigationBarItem(
          icon: selectedIndex == 3
              ? const Icon(Icons.person_2_sharp)
              : const Icon(Icons.person_outlined, color: Color.fromARGB(255, 63, 160, 153)),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Color.fromARGB(255, 63, 160, 153),
      onTap: onItemTapped,
    );
  }
}
