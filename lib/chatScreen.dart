import 'package:flutter/material.dart';
import 'callMe.dart';

class ChatScreen extends StatelessWidget {
  final String chatName;

  const ChatScreen({super.key, required this.chatName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            const SizedBox(width: 25),
            Text(
              chatName,
              style: const TextStyle(
                color: Color.fromARGB(255, 236, 236, 236),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.call, color: Colors.white),
              onPressed: () {
               Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => CallingTab(callerName: chatName, callerImageUrl: "",),
                    ));
              },
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 66, 73, 77),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
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
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Type a message...",
                          hintStyle: const TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 66, 73, 77),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 20.0,
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
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
