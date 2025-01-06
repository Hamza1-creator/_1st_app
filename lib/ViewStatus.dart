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

  void _pauseProgress() {
    _animationController.stop(); // Pause the progress
  }

  void _resumeProgress() {
    _animationController.forward(); // Resume the progress
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _pauseProgress(), // Pause when pressed
      onTapUp: (details) => _resumeProgress(), // Resume when released
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 59, 63, 66),
        body: Stack(
          children: [
            // Background Color
            Container(
              color: const Color.fromARGB(255, 59, 63, 66),
            ),

            // Center the Status Image
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9, // Make image smaller
                height: MediaQuery.of(context).size.height * 0.8, // Adjust image height
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
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => LinearProgressIndicator(
                      value: _animationController.value,
                      backgroundColor: Colors.white38,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
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
      ),
    );
  }
}
