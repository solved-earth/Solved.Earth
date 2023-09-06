import 'package:flutter/material.dart';

class ChallengeModel extends ChangeNotifier {
  final List _challenges = [
    // [challnge name, achievement condition, additional explanation, isAchieved, unique number]
    [
      '종이 컵 대신 머그컵을',
      '종이컵이 아닌 머그컵을 사용하는 사진을 찍어주세요',
      '2021년 대한민국에서 141,547톤의 일회용 컵이 생산되었습니다. 이는 아시아 코끼리 35,380마리와 비슷한 무게입니다. 심지어 아시아 코끼리는 전 세계에 약 15,000마리 밖에 없습니다.',
      false, // For evaluating whether the user passed the certification of the challenge
      0,
    ],
    [
      '대중교통 이용하기!',
      '대중교통을 이용하는 본인의 모습을 찍어주세요',
      '1주일에 한 번 대중교통을 이용할 경우, 218.5ℓ(휘발유 승용차 1대 기준)의 연료를 절감할 수 있고 약 33만원의 비용 절감의 효과가 있습니다. 이는 연간 469.4kg의 이산화탄소를 줄일 수 있는 양으로 30년생 소나무 약 71그루를 식재하는 효과입니다.',
      false,
      1,
    ],
    [
      '헌 옷 기부하기!',
      '헌 옷을 폐기하지 않고 기부하는 모습을 찍어주세요',
      '헌 옷을 버리는 과정에서 옷이 썩으면 이산화탄소와 메탄 등 유독가스가 배출됩니다. 이렇게 버려진 옷으로 인한 전 세계 탄소배출량은 연간 120억 톤. 전 세계 온실가스 배출량의 10%에 달하는 수치입니다.',
      false,
      2,
    ],
    [
      '담배꽁초 줍기!',
      '새로운 플라스틱 용기에 담긴 제품이 아닌 리필형 제품을 구매하는 모습을 찍어주세요',
      '슈퍼에 가면 세탁 세제, 바디 워시, 샴푸 등, 거의 모든 것이 플라스틱 안에 담겨있습니다. 플라스틱 통이 아닌 리필형이 있다면 그 제품을 선택하거나, 이미 집에 있는 빈 플라스틱 용기를 최대한 활용하면 그만큼 소비하는 플라스틱 양도 줄일 수 있을 것입니다.',
      false,
      3,
    ],
  ];

  // Achieved challenge list
  final List _achievements = [];

  List get challenges => _challenges;
  List get achievements => _achievements;

  // Logic for challenge certification success indication
  void clearChallenge(int index) {
    _challenges[index][3] = true;
    _achievements.add(_challenges[index]);
    notifyListeners();
  }

  // Return number of achieved challenge
  int numberofAchienements() {
    return _achievements.length;
  }
}
