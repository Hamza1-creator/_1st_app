import 'package:flutter/material.dart';

class ViewStatus extends StatefulWidget {
  final String imageUrl; // URL or asset path of the status image
  final String userName; // Name of the user whose status is being viewed

  const ViewStatus({super.key, required this.imageUrl, required this.userName});

  @override
  State<ViewStatus> createState() => _ViewStatusState();
}

class _ViewStatusState extends State<ViewStatus> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Duration for the status
    );

    _animationController.forward();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context); // Exit the screen after the status ends
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
    // Background Color
    Container(
      color: Colors.black,
    ),

    // Center the Status Image
    Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // Make image smaller
        height: MediaQuery.of(context).size.height * 0.5, // Adjust image height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
      ),
    ),

    // Progress Indicator and User Info
    Positioned(
      top: 30, // Place progress bar higher
      left: 10,
      right: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress Bar
          LinearProgressIndicator(
            value: _animationController.value,
            backgroundColor: Colors.white38,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          const SizedBox(height: 10),

          // User Info
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.imageUrl),
              ),
              const SizedBox(width: 10),
              Text(
                widget.userName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    ),

          // Navigation Buttons
          Row(
            children: [
              // Go to Previous Status
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Previous status (not implemented)")),
                    );
                  },
                ),
              ),
              // Go to Next Status
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Next status (not implemented)")),
                    );
                  },
                ),
              ),
            ],
          ),

          // Close Button
          Positioned(
            top: 40,
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
