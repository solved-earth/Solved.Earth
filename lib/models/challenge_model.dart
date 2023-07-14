import 'package:flutter/material.dart';

class ChallengeModel extends ChangeNotifier {
  final List _challenges = [
    // [challnge name, achievement condition, additional explanation, isAchieved, unique number]
    [
      '커여운 고양이',
      '고양이를 찾아 사진을 찍으세요',
      '모든 고양이는 귀엽습니당',
      false, //성공, 실패 여부 판단 ==>
      0,
    ],
    [
      '안녕하수달',
      '1. 수달을 찾으세요\n2. 인사하는 사진을 찍으세요',
      '전 수달이 귀여워요',
      false,
      1,
    ],
    [
      '와 야생의 찬희다',
      '1. 찬희를 찾으세요',
      '헉',
      false,
      2,
    ],
  ];

  final List _achievements = [];

  List get challenges => _challenges;
  List get achievements => _achievements;

  void clearChallenge(int index) {
    _challenges[index][3] = true;
    _achievements.add(_challenges[index]);
    notifyListeners();
  } // 성공 표시를 위한 로직
}
