import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'onBoardingScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      routes: {
      '/onboarding': (context) => const OnboardingScreen(),
      '/home':(context) => const HomeScreen(),
      },
    );
  }
}




