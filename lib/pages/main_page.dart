import 'package:flutter/material.dart';
import 'package:app/models/tree_model.dart';

class MainPage extends StatelessWidget {
  MainPage(
      {super.key,

      //required this.index,
      index});

  //final int index;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/green_meadow.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'lib/images/green_meadow.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // Overlay Image
            Positioned(
              bottom: 10,
              left: 105.7,
              child: /*Image.asset(
                'lib/images/tree_illust.png',
                width: 200,
                height: 200,
              ),*/
                  Image.network(treeModelList[index].thumbnailUrl),
            ),
          ],
        ),
      ),
    );
  }
}
