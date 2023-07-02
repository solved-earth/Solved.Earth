import 'package:app/models/challenge_model.dart';
import 'package:app/side_menu/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChallengeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SideBar(),
        theme: ThemeData(primarySwatch: Colors.lightGreen),
      ),
    );
  }
}
