import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasky/features/splash/splash_controller.dart';
import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController _controller = SplashController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (!_controller.isLoading) {
        Timer(const Duration(seconds: 1), () {
          // Navigate to the main app screen after the splash screen
          // If username is empty, navigate to WelcomeScreen, otherwise MainScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => MyApp(username: _controller.username),
            ),
          );
        });
      }
    });

    _controller.initApp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF181818),
      body: Center(child: Image(image: AssetImage('assets/images/Vector.png'))),
    );
  }
}
