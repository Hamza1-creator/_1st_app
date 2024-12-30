import 'package:flutter/material.dart';


class CallingTab extends StatelessWidget {
  const CallingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Make a Call from here",
        style: TextStyle(fontSize: 24, color: Colors.red),
      ),
    );
  }
}