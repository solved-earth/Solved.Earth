import 'package:app/models/challenge_model.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/tree_design_page.dart';
import 'package:app/models/tree_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final challengeModelProvider =
    ChangeNotifierProvider<ChallengeModel>((ref) => ChallengeModel());

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
                child: Consumer(
                  builder: (context, WidgetRef ref, _) {
                    final int numberofAchievements = ref
                        .read(challengeModelProvider)
                        .numberofAchienements(); // 오류 수정
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
