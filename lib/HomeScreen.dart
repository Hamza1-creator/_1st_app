import 'package:flutter/material.dart';
import 'Chat.dart';
import 'CartTab.dart';
import 'Setting.dart';
import 'callMe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // List of pages (widgets) for each tab
  final List<Widget> _pages = [
    const Messages(),
    const CartPage(),
    const SettingsTab(),
    const CallingTab(),
  ];

  // Titles for each tab
  final List<String> _titles = [
    "Messages",
    "Cart",
    "Settings",
    "Calling",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea( child : Scaffold(
     appBar: AppBar(
        title: Text(_titles[_currentIndex]), // Dynamic title based on the current tab
        actions: [
          IconButton(
            icon: const Icon(Icons.search), // Search icon
            onPressed: () {
              // Handle search button tap
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Search tapped")),
              );
            },
          ),
        ],
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
            icon: Icon(Icons.chat_sharp),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: "Cart",
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
    ),);
  }
}