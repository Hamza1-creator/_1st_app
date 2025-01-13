import 'package:flutter/material.dart';
import 'chatScreen.dart';

class CallingTab extends StatelessWidget {
  final String callerName;
  final String callerImageUrl;

  const CallingTab({
    super.key,
    required this.callerName,
    required this.callerImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111B21),
      body: Stack(
        children: [
          // Caller Information
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.blue,
                  backgroundImage: ( callerImageUrl.isNotEmpty)
                      ? NetworkImage(callerImageUrl)
                      : null,
                  child: (callerImageUrl.isEmpty)
                      ? Text(
                          callerName[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )
                      : null,
                ),

                const SizedBox(height: 20),
                Text(
                  callerName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Calling...",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Mute Button
                FloatingActionButton(
                  heroTag: "mute",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Mute Button Pressed")),
                    );
                  },
                  backgroundColor: const Color(0xFF2A3942),
                  child: const Icon(Icons.mic_off, color: Colors.white),
                ),
                // End Call Button
                FloatingActionButton(
                  heroTag: "end_call",
                  onPressed: () {
                    Navigator.pop(context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(chatName: callerName),
                    ),
                    );
                  },
                  backgroundColor: Colors.red,
                  child: const Icon(Icons.call_end, color: Colors.white),
                ),
                FloatingActionButton(
                  heroTag: "speaker",
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Speaker Button Pressed")),
                    );
                  },
                  backgroundColor: const Color(0xFF2A3942),
                  child: const Icon(Icons.volume_up, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
