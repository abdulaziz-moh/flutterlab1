import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home_screen.dart';

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({super.key});

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // for testing purpose with the splash screen
      // await GoogleSignIn().signOut();
      // await FirebaseAuth.instance.signOut();

      final GoogleSignInAccount? googleUser =
          await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // ✅ CORRECT NAVIGATION
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );

      debugPrint("Successfully signed in!");
    } catch (e) {
      debugPrint("Google Sign-In error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Sign-In")),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => signInWithGoogle(context),
          child: const Text("Continue with Google"),
        ),
      ),
    );
  }
}
