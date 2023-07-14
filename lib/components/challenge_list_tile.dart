import 'package:app/pages/challenge_page.dart';
import 'package:flutter/material.dart';

class ChallengeListTile extends StatelessWidget {
  final String challgeName;
  final String achievementCondition;
  final String additionalExplanation;
  final int index;

  const ChallengeListTile({
    super.key,
    required this.challgeName,
    required this.achievementCondition,
    required this.additionalExplanation,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChallengePage(
                challngeName: challgeName,
                achievementCondition: achievementCondition,
                additionalExplanation: additionalExplanation,
                index: index,
              );
            },
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                challgeName,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
