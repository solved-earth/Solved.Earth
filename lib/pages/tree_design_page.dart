import 'package:flutter/material.dart';

class TreeDesignPage extends StatelessWidget {
  const TreeDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/landscape1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
