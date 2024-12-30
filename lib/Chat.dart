import 'package:flutter/material.dart';
import 'ChatsTab.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: TabBar(
              indicatorColor: Color.fromARGB(255, 126, 126, 126),
              tabs: [
                Tab(text: "Chats"),
                Tab(text: "Status"),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            ChatsTab(),
            StatusTab(),
          ],
        ),
      ),
    );
  }
}

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Status Tab",
        style: TextStyle(fontSize: 24, color: Colors.green),
      ),
    );
  }
}
