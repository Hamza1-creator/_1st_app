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
          backgroundColor: Colors.grey[200],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: Colors.blue), // Thickness and color of the indicator
                insets: EdgeInsets.symmetric(horizontal: 80.0), // Adjust padding to make the indicator narrower
              ),
              indicatorSize: TabBarIndicatorSize.label, // Use this for the label size
              tabs: const [
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
