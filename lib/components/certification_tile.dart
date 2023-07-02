import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/challenge_model.dart';

class CertificationTile extends StatelessWidget {
  final int index;

  const CertificationTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    ChallengeModel challengeModel = Provider.of<ChallengeModel>(context);

    void handleTap() {
      bool isAchieved = challengeModel.challenges[index][4];
      if (isAchieved) {
      } else {
        challengeModel.clearChallenge(index);
      }
    }

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: challengeModel.challenges[index][4]
              ? Colors.green[200]
              : Colors.red[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            challengeModel.challenges[index][4] ? '인증 완료' : '인증 하기',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
