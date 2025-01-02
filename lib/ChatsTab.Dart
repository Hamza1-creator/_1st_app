import 'package:flutter/material.dart';

class Chat {
  final String name;
  final String lastMessage;
  final String imageUrl;
  final String lastMessageTime;

  Chat({required this.name, required this.lastMessage, required this.imageUrl, required this.lastMessageTime});
}

class ChatsTab extends StatefulWidget {
  const ChatsTab({super.key});

  @override
  State<ChatsTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatsTab> {
  final List<Chat> _allChats = [
    Chat(name: "John Doe", lastMessage: "Hello! How are you?", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
    Chat(name: "Jane Smith", lastMessage: "Are we meeting today?", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
    Chat(name: "Alex Brown", lastMessage: "I'll call you later.", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
    Chat(name: "Charlie", lastMessage: "Check out this photo!", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
    Chat(name: "David", lastMessage: "Good morning!", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
    Chat(name: "Eve", lastMessage: "Lets GO", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
    Chat(name: "Alice", lastMessage: "Hey there!", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
    Chat(name: "Bob", lastMessage: "How's it going?", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
    Chat(name: "Tommy Shelby", lastMessage: "MachineGun or pistol ?", imageUrl: "https://via.placeholder.com/150", lastMessageTime : "10:30 AM"),
  ];

  List<Chat> _filteredChats = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredChats = _allChats;
    _searchController.addListener(_filterChats);
  }

  void _filterChats() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      _filteredChats = _allChats.where((chat) => chat.name.toLowerCase().contains(query)).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterChats);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 83, 88),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search chats...",
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
          Expanded(
            child: ListView.builder(
              itemCount: _filteredChats.length,
              itemBuilder: (context, index) {
                final chat = _filteredChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      chat.name[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    chat.name,
                    style: const TextStyle(color: Color.fromARGB(255, 236, 236, 236)),
                  ),
                  subtitle: Text(
                    chat.lastMessage,
                    style: const TextStyle(color: Color.fromARGB(255, 207, 207, 207)),
                  ),
                  trailing: Text(chat.lastMessageTime, style: TextStyle(color: const Color.fromARGB(255, 207, 207, 207))),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Tapped on ${chat.name}")),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
