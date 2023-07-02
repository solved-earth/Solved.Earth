import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          //tree screen
          Padding(
            padding: const EdgeInsets.only(
              left: 60,
              right: 60,
              bottom: 0,
              top: 60,
            ),
            child: Image.asset('lib/images/tree.jpg'),
          ),
        ],
      ),
    );
  }
}
