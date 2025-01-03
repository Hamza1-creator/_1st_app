import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String chatName;

  const ChatScreen({super.key, required this.chatName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back, // Custom back icon
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Aligns items to the start
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  chatName[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 25), // Adjust the spacing here
              Text(
                chatName,
                style: const TextStyle(
                  color: Color.fromARGB(255, 236, 236, 236),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 66, 73, 77),
        ),


      backgroundColor: const Color.fromARGB(255, 77, 83, 88),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: const [
                ChatBubble(
                  message: "Hi! How are you?",
                  isSender: false,
                ),
                ChatBubble(
                  message: "I'm good, thank you!",
                  isSender: true,
                ),
                ChatBubble(
                  message: "What about you?",
                  isSender: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const ChatBubble({super.key, required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSender ? Colors.blue : Colors.grey[700],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
