import 'package:flutter/material.dart';
import 'package:hen_bloc_practice/features/dashboard/dashboard_page.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _currentIndex = 0;

  final _pages = [const DashboardPage(), Container(color: Colors.blue), Container(color: Colors.pink[100]), Container(color: Colors.purple[100])];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        backgroundColor: Colors.green[700], // Slightly darker green
        selectedItemColor: Colors.white, // Active icon & label color
        unselectedItemColor: Colors.white70, // Inactive icon & label color
        type: BottomNavigationBarType.fixed, // Ensures all labels show
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Items"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
