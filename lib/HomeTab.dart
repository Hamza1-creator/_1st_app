import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    // You can write any logic here
    return Center(
      child: Text(
        "Welcome to the Home Page",
        style: TextStyle(fontSize: 24, color: Colors.blue),
      ),
    );
  }
}