import 'package:app/components/achievement_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_page.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Consumer(
            builder: (context, watch, child) {
              final value = watch.read(challengeModelProvider);
              return GridView.builder(
                //value == challenge model
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
                  ); //AchievementTile == 네모 하나(좌측 상단, 우측 상단, 좌측 하단, 우측 하단)
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
