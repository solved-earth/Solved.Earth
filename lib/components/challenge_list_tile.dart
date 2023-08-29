import 'package:app/view/pages/challenge_page.dart';
import 'package:flutter/material.dart';

class ChallengeListTile extends StatelessWidget {
  // Properties to store information about the challenge
  final String challgeName; // The name of the challenge
  final String
      achievementCondition; // The condition required to achieve the challenge
  final String
      additionalExplanation; // Additional explanation or details about the challenge
  final int index; // The index of the challenge

  // Constructor for the ChallengeListTile
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
        // Navigate to ChallengePage when the tile is tapped
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
              // Display the challenge name in the tile
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
