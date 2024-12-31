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


  final List<Widget> _pages = [
    const Messages(),
    const CartPage(),
    const SettingsTab(),
    const CallingTab(),
  ];

  final List<String> _titles = [
    "Messages",
    "Cart",
    "Settings",
    "Calling",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child : Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 83, 88),
     appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 77, 83, 88),
      toolbarHeight: 40.0,
        title: Text(_titles[_currentIndex] ,style: TextStyle(color: const Color.fromARGB(255, 236, 236, 236)),),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: const Color.fromARGB(255, 236, 236, 236),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Search tapped")),
              );
            },
          ),
        ],
      ),

      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 77, 83, 88),
        selectedItemColor: const Color.fromARGB(255, 236, 236, 236),
        unselectedItemColor: const Color.fromARGB(255, 201, 202, 202),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_sharp),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
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