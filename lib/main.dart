import 'package:flutter/material.dart';
import 'HomeTab.dart';
import 'ProfileTab.dart';
import 'Setting.dart';
import 'callMe.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of pages (widgets) for each tab
  final List<Widget> _pages = [
    const HomeTab(),
    const ProfileTab(),
    const SettingsTab(),
    const CallingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Tabs Example"),
        centerTitle: true,
      ),
      body: _pages[_currentIndex], // Dynamically switch between widgets
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Support more than 3 items
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Calling",
          ),
        ],
      ),
    );
  }
}


