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
  late Future<void> _loadingFuture;
  bool _isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

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

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  void initState() {
    super.initState();
    _loadingFuture = _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadingFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Color.fromARGB(255, 77, 83, 88),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      minHeight: 3, 
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 77, 83, 88),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 77, 83, 88),
                toolbarHeight: 40.0,
                title: Text(
                  _titles[_currentIndex],
                  style: const TextStyle(color: Color.fromARGB(255, 236, 236, 236)),
                ),
                actions: [
                  IconButton(
                    icon: Icon(_isSearchVisible ? Icons.close : Icons.search),
                    color: const Color.fromARGB(255, 236, 236, 236),
                    onPressed: () {
                      setState(() {
                        _isSearchVisible = !_isSearchVisible;
                        if (!_isSearchVisible) {
                          _searchController.clear();
                        }
                      });
                    },
                  ),
                ],
              ),
              body: Column(
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _isSearchVisible ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      height: _isSearchVisible ? 60.0 : 0.0,
                      child: TextField(
                        controller: _searchController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Search...",
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 66, 73, 77),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _pages[_currentIndex],
                  ),
                ],
              ),
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
            ),
          );
        }
      },
    );
  }
}
