// This code file defines a Flutter widget called AchievementTile, which is used to display
// information about a specific achievement in the app. When tapped, it navigates to a
// ChallengePage that provides more details about the achievement.

// Import required packages and libraries
import 'package:app/view/pages/challenge_page.dart';
import 'package:flutter/material.dart';

// Define the AchievementTile class, which is a StatelessWidget used to display achievement information
class AchievementTile extends StatelessWidget {
  // Properties to store information about the achievement
  final String challgeName; // The name of the challenge
  final String
      achievementCondition; // The condition required to achieve the challenge
  final String
      additionalExplanation; // Additional explanation or details about the challenge
  final int index; // The index of the achievement

  // Constructor for the AchievementTile
  const AchievementTile({
    super.key,
    required this.challgeName,
    required this.achievementCondition,
    required this.additionalExplanation,
    required this.index,
  });

  // Build method to create the UI of the AchievementTile widget
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
