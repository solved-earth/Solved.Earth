import 'package:flutter/material.dart';

class ChallengeModel extends ChangeNotifier {
  final List _challenges = [
    // [challnge name, achievement condition, additional explanation, isAchieved, unique number]
    [
      '종이 컵 대신 머그컵을',
      '종이컵이 아닌 머그컵을 사용하는 사진을 찍어주세요',
      '2021년 대한민국에서 141,547톤의 일회용 컵이 생산되었습니다. 이는 아시아 코끼리 35,380마리와 비슷한 무게입니다. 심지어 아시아 코끼리는 전 세계에 약 15,000마리 밖에 없습니다.',
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
