import 'package:flutter/material.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {"name": "Alice", "message": "Hello! How are you?", "time": "10:30 AM"},
      {"name": "Bob", "message": "Are we meeting today?", "time": "9:45 AM"},
      {"name": "Charlie", "message": "I'll call you later.", "time": "8:15 AM"},
      {"name": "David", "message": "Check out this photo!", "time": "7:20 AM"},
      {"name": "Eve", "message": "Good morning!", "time": "6:00 AM"},
      {"name": "Ahmed", "message": "Lets GO", "time": "6:00 AM"},
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 83, 88),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return Card(
            shape: Border(bottom: BorderSide(color: const Color.fromARGB(255, 56, 56, 56), width: 1)),
            color: const Color.fromARGB(255, 77, 83, 88),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text(
                  chat["name"]![0],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(chat["name"]!, style: TextStyle(color: const Color.fromARGB(255, 236, 236, 236))),
              subtitle: Text(chat["message"]!, style: TextStyle(color: const Color.fromARGB(255, 207, 207, 207))),
              trailing: Text(chat["time"]!, style: TextStyle(color: const Color.fromARGB(255, 207, 207, 207))),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Tapped on ${chat['name']}")),
                );
              },
            ),
          );

        },
      ),
    );
  }
}
