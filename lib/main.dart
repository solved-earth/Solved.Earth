import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/resources/router.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(
      fileName: ".env"); // Load environment variables from .env file.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase services.

  runApp(
    // Wrap the app with the ProviderScope from Riverpod.
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Create MaterialApp with custom router configuration.
    return MaterialApp.router(
      routerConfig: router, // Use the defined router configuration.
      debugShowCheckedModeBanner: false, // Hide the debug banner.
      theme:
          ThemeData(primarySwatch: Colors.lightGreen), // Set the app's theme.
    );
  }
}
