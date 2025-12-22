import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_1/firebase_options.dart';
// import 'package:flutter_lab_1/screens/home_screen.dart';
import 'package:flutter_lab_1/screens/splash_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(const MyApp());
  runApp(const MaterialApp(home: GoogleSignInPage()));
}

class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({super.key});

  Future<void> signInWithGoogle() async {
    try {
      // 1. Trigger the Google sign-in flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      
      // 2. Get auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // 3. Create a new credential for Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // 4. Sign in to Firebase with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Navigator.push(MyApp())
      print("Successfully signed in!");
    } catch (e) {
      print("Error during Google Sign-In: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Sign-In")),
      body: Center(
        child: ElevatedButton(
          onPressed: signInWithGoogle,
          child: const Text("Continue with Google"),
        ),
      ),
    );
  }
}








class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "facebook",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
          primary: Colors.white,
          secondary: const Color(0xFF1877F2),
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black87),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
