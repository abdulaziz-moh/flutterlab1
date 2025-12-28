import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_lab_1/app/app.dart';
import 'package:flutter_lab_1/auth/auth_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),  // (_) => AuthProvider(), also possible because the parameter is unused
      child: const MyApp(),
    ),
  );
}
