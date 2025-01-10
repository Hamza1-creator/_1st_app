import 'package:flutter/material.dart';
import 'HomeScreen.dart'; // Import your HomeTab screen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingData = [
      {
        "title": "Welcome to the App",
        "subtitle": "Discover amazing features tailored just for you.",
        "image": "assets/onboarding-concept-illustration_114360-1048-removebg-preview.png",
      },
      {
        "title": "Stay Connected",
        "subtitle": "Connect with your friends and family seamlessly.",
        "image": "assets/business-deal-concept-illustration_114360-1306-removebg-preview.png",
      },
      {
        "title": "Achieve Your Goals",
        "subtitle": "Track your progress and reach your objectives.",
        "image": "assets/together-concept-illustration_114360-645-removebg-preview.png",
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 83, 88), 
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onboardingData[index]["image"]!,
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      onboardingData[index]["title"]!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 236, 236, 236)
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      onboardingData[index]["subtitle"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 201, 202, 202)),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: _currentPage == index ? 20 : 10,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.blue : Color.fromARGB(255, 236, 236, 236),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage == onboardingData.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25), 
                ),
              ),
              child: Text(
                style : const TextStyle(color: Color.fromARGB(255, 236, 236, 236)),
                _currentPage == onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
