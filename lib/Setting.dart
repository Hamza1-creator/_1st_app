import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Adjust your Settings here",
        style: TextStyle(fontSize: 24, color: Colors.orange),
      ),
    );
  }
}