import 'package:flutter/material.dart';
import 'ViewStatus.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 83, 88),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: const AssetImage('assets/your_profile.jpg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          color: Colors.blue,
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
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:  Color.fromARGB(255, 236, 236, 236)),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Tap to add status update",
                      style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 207, 207, 207)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),

          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Recent updates",
              style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 207, 207, 207), fontWeight: FontWeight.bold),
            ),
          ),
          ..._buildStatusList(context),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: FloatingActionButton(
              heroTag: "edit",
              backgroundColor: Colors.grey[300],
              shape: Border(bottom: BorderSide(color: const Color.fromARGB(255, 56, 56, 56))),
              onPressed: () {
              },
              child: const Icon(Icons.edit, color: Colors.black, size: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: "camera",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Add new chat pressed")),
              );
            },
            backgroundColor: Colors.blue,
            shape: Border(bottom: BorderSide(color: const Color.fromARGB(255, 56, 56, 56), width: 10)),
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ],
      ),


    );
  }

  List<Widget> _buildStatusList(context) {
    final List<Map<String, String>> recentStatuses = [
      {
        "name": "John Doe",
        "time": "Today, 10:30 AM",
        "image": "assets/background.jpeg",
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
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:  Color.fromARGB(255, 236, 236, 236)),
              ),
              subtitle: Text(
                status['time']!,
                style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 207, 207, 207)),
              ),
             onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewStatus(
                        imageUrl: status['image']!, // Pass the status image URL
                        userName: status['name']!, // Pass the user's name
                      ),
                    ),
                  );
                },

            ))
        .toList();
  }
}
