import 'package:flutter/material.dart';
import 'package:app/pages/tree_design_page.dart';

class Tree extends StatelessWidget {
  const Tree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Positioned(
          bottom: 10,
          left: 105.7,
          child: GestureDetector(
            onTap: () {
              // Navigate to another page or perform any desired action
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TreeDesignPage(),
                ),
              );
            },
            child: Image.asset(
              'lib/images/tree_illust.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
