import 'package:flutter/material.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: ListView(
        children: [
          // Your Status Section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: const AssetImage('assets/your_profile.jpg'), // Replace with your image
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.green[600],
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "My Status",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Tap to add status update",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          // Recent Updates Section
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Recent updates",
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          ..._buildStatusList(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "edit",
            backgroundColor: Colors.grey[300],
            onPressed: () {
              // Add functionality for editing status
            },
            shape: Border(bottom: BorderSide(color: const Color.fromARGB(255, 56, 56, 56), width: 0)),
            child: const Icon(Icons.edit, color: Colors.black),
          ),
          const SizedBox(
            width: 50, 
            height: 50,),
          FloatingActionButton(
            heroTag: "camera",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Add new chat pressed")),
            );
            },shape: Border(bottom: BorderSide(color: const Color.fromARGB(255, 56, 56, 56), width: 10)),
             backgroundColor: Colors.blue,
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStatusList() {
    final List<Map<String, String>> recentStatuses = [
      {
        "name": "John Doe",
        "time": "Today, 10:30 AM",
        "image": "assets/john.jpg", // Replace with actual paths
      },
      {
        "name": "Jane Smith",
        "time": "Today, 9:15 AM",
        "image": "assets/jane.jpg",
      },
      {
        "name": "Alex Brown",
        "time": "Yesterday, 5:45 PM",
        "image": "assets/alex.jpg",
      },
    ];

    return recentStatuses
        .map((status) => ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(status['image']!),
              ),
              title: Text(
                status['name']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                status['time']!,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              onTap: () {
                // // Add functionality to view status
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text("Viewing ${status['name']}'s status")),
                // );
              },
            ))
        .toList();
  }
}
