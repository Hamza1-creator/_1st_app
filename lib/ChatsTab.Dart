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

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Text(
              chat["name"]![0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(chat["name"]!),
          subtitle: Text(chat["message"]!), 
          trailing: Text(chat["time"]!),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Tapped on ${chat['name']}")),
            );
          },
        );
      },
    );
  }
}