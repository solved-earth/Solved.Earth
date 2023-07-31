import 'package:flutter/material.dart';
import 'package:app/pages/tree_design_page.dart';
import 'package:app/models/tree_model.dart';
import 'package:app/models/challenge_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Consumer<ChallengeModel>(
                  builder: (context, challengeModel, _) {
                    final int numberofAchievements =
                        challengeModel.numberofAchienements();
                    return Image(
                      image: AssetImage(treeModelList[selectedtreeindex].path),
                      //make tree bigger
                      width: 200 + numberofAchievements * 100,
                      height: 200 + numberofAchievements * 100,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
