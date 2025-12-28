import 'package:flutter/material.dart';
import 'package:flutter_lab_1/auth/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthService().signInWithGoogle();
          },
          child: const Text("Continue with Google"),
        ),
      ),
    );
  }
}
