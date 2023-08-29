import 'package:app/components/certification_tile.dart';
import 'package:flutter/material.dart';
import 'package:app/Constants/gaps.dart';

// Screen for displaying details of a challenge.
class ChallengePage extends StatelessWidget {
  final String challngeName; //Name of the challenge
  final String achievementCondition; // Condition of the challenge
  final String
      additionalExplanation; // Additional explanation about the challenge
  final int index; // Index of the challenge

  const ChallengePage({
    super.key,
    required this.challngeName, // Constructor parameters for challenge name
    required this.achievementCondition, // Constructor parameters for ahievement condition
    required this.additionalExplanation, // Constructor parameters for additional explanation about the challenge
    required this.index, // Constructor parameters for index
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Show challenge name on title
      appBar: AppBar(
        title: Text(challngeName), // Show challenge name in the title.
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //show achievementCondition
              Gaps.v20,
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    achievementCondition, // Display achievement condition.
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Gaps.v24,

              // Rendering a certification tile component
              CertificationTile(
                  index:
                      index), // This tile posts image and gets certification of the challenges.
              Gaps.v24,

              // Show additional Explanation
              Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    additionalExplanation,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
