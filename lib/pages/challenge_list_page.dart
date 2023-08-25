import 'package:app/components/challenge_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_page.dart';

class ChallngeListPage extends StatelessWidget {
  const ChallngeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context, watch, child) {
                final challengeModel = watch
                    .read(challengeModelProvider); //provider of challenge model
                return GridView.builder(
                  itemCount: challengeModel.challenges.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 5 / 1, // aspect ratio
                  ),
                  itemBuilder: (context, index) {
                    return ChallengeListTile(
                      challgeName: challengeModel.challenges[index]
                          [0], //challenge name
                      achievementCondition: challengeModel.challenges[index]
                          [1], //achievement
                      additionalExplanation: challengeModel.challenges[index]
                          [2], //additional explanation
                      index: challengeModel.challenges[index]
                          [4], //index of the achievement
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
