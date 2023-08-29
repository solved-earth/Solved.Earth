import 'package:app/components/achievement_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_page.dart';

// Screen for displaying achievements.
class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

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
                  itemCount: challengeModel.achievements.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    // Display individual achievement tiles.
                    return AchievementTile(
                      challgeName: challengeModel.achievements[index]
                          [0], // Challenge name
                      achievementCondition: challengeModel.achievements[index]
                          [1], // Condition description
                      additionalExplanation: challengeModel.achievements[index]
                          [2], // Additional explanation
                      index: challengeModel.achievements[index]
                          [4], // Index of the achievement
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
