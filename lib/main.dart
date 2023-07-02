import 'package:app/models/challenge_model.dart';
import 'package:app/side_menu/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChallengeModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SideBar(),
      ),
    );
  }
}
