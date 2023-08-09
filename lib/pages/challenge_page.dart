import 'package:app/components/certification_tile.dart';
import 'package:flutter/material.dart';
import 'package:app/Constants/gaps.dart';

class ChallengePage extends StatelessWidget {
  final String challngeName;
  final String achievementCondition;
  final String additionalExplanation;
  final int index;

  const ChallengePage({
    super.key,
    required this.challngeName,
    required this.achievementCondition,
    required this.additionalExplanation,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(challngeName),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),

                //achievementCondition
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      achievementCondition,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Gaps.v24,

                //인증 버튼
                CertificationTile(index: index),
                const SizedBox(
                  height: 24,
                ),

                //additionalExplanation
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
        ));
  }
}
