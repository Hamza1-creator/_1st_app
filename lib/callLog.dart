import 'package:flutter/material.dart';

class Calllog extends StatelessWidget {
  const Calllog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "This is call Logs",
        style: TextStyle(fontSize: 24, color: Colors.orange),
      ),
    );
  }
}