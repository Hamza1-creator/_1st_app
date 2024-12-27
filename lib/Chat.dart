import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48.0), // Set the height of the TabBar
            child: TabBar(
              indicatorColor: Colors.white, // Customize the indicator
              tabs: [
                Tab(text: "Chats"),
                Tab(text: "Status"),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                "Chats Tab",
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
            ),
            Center(
              child: Text(
                "Status Tab",
                style: TextStyle(fontSize: 24, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
