import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_1/screens/home/home_screen.dart';
import 'package:flutter_lab_1/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      
      final user = FirebaseAuth.instance.currentUser;

      if (!mounted) return;

      if (user != null) {
        // ✅ User already logged in
       Navigator.pushReplacement(
        context,
        // for testing purpose
        // MaterialPageRoute(builder: (_) => const LoginScreen()),
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );

      } else {
        // ❌ Not logged in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.facebook,
              color: Color(0xFF1877F2),
              size: 90,
            ),
            SizedBox(height: 12),
            Text(
              "facebook",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1877F2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
