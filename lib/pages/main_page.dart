import 'package:flutter/material.dart';
import 'package:app/pages/tree_design_page.dart';
import 'package:app/models/tree_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/green_meadow.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'images/green_meadow.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Overlay Image
            Positioned(
              bottom: 10,
              left: 105.7,
              child: Image(
                image: AssetImage(treeModelList[selectedtreeindex].path),
                width: 200,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
