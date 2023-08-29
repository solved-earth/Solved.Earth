import 'package:app/components/challenge_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_page.dart';

// Screen for displaying the list of challenges.
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
                final challengeModel = watch.read(
                    challengeModelProvider); // Provider of challenge model.
                return GridView.builder(
                  itemCount: challengeModel.challenges.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 5 / 1, // Aspect ratio for each tile.
                  ),
                  itemBuilder: (context, index) {
                    return ChallengeListTile(
                      challgeName: challengeModel.challenges[index]
                          [0], // Challenge name.
                      achievementCondition: challengeModel.challenges[index]
                          [1], // Achievement condition.
                      additionalExplanation: challengeModel.challenges[index]
                          [2], // Additional explanation.
                      index: challengeModel.challenges[index]
                          [4], // Index of the achievement.
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
