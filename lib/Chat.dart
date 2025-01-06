import 'package:flutter/material.dart';
import 'ChatsTab.dart';
import 'statusTab.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 77, 83, 88),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: TabBar(
              labelColor: const Color.fromARGB(255, 236, 236, 236),
              unselectedLabelColor: const Color.fromARGB(255, 236, 236, 236),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: Colors.blue),
                insets: EdgeInsets.symmetric(horizontal: 80.0), 
              ),
              indicatorSize: TabBarIndicatorSize.label, 
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
