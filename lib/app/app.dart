import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider; // also we have a built in AuthProvider in this package so:
                                                              // 1, hide that specific class that conflicts naming
                                                              // 2, add "as fb"; // Prefix it and from this on every class from this package we use fb.AuthProvider fb.User etc.
import 'package:flutter/material.dart';
import 'package:flutter_lab_1/screens/home/home_screen.dart';
// import 'package:flutter_lab_1/screens/login_screen.dart';
import 'package:flutter_lab_1/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_lab_1/auth/auth_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

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
      
      home: authProvider.isLoggedIn? const HomeScreen() : const LoginScreen(), //here we the home route choosed 

    );
  }
}
