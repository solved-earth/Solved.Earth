import 'package:app/components/achievement_tile.dart';
import 'package:app/models/challenge_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Consumer<ChallengeModel>(
            builder: (context, value, child) => GridView.builder(
              itemCount: value.achievements.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.2,
              ),
              itemBuilder: (context, index) {
                return AchievementTile(
                  challgeName: value.achievements[index][0],
                  achievementCondition: value.achievements[index][1],
                  additionalExplanation: value.achievements[index][2],
                  index: value.achievements[index][4],
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
