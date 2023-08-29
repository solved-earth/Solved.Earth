import 'package:flutter/material.dart';

class ChallengeModel extends ChangeNotifier {
  final List _challenges = [
    // [challnge name, achievement condition, additional explanation, isAchieved, unique number]
    [
      '종이 컵 대신 머그컵을',
      '종이컵이 아닌 머그컵을 사용하는 사진을 찍어주세요',
      '2021년 대한민국에서 141,547톤의 일회용 컵이 생산되었습니다. 이는 아시아 코끼리 35,380마리와 비슷한 무게입니다. 심지어 아시아 코끼리는 전 세계에 약 15,000마리 밖에 없습니다.',
      false, // For evaluating whether the user passed the certification of the challenge
      1,
    ],
    [
      '고체샴푸 이용하기!',
      '고체샴푸를 구매하여 비치해 둔 사진을 찍어주세요',
      '액체샴푸 속 계면활성제는 고분자물질입니다. 고분자물질은 미생물에 의한 분해가 어려워 수질오염에 악영향을 미칩니다. 액체샴푸 대신 고체샴푸를 쓰면 화학 계면활성제의 ‘소듐라우릴설페이트’가 제외돼 두피 보호는 물론 환경에도 좋습니다.',
      false,
      2,
    ],
    [
      '대중교통 이용하기!',
      '대중교통을 이용하는 본인의 모습을 찍어주세요',
      '1주일에 한 번 대중교통을 이용할 경우, 218.5ℓ(휘발유 승용차 1대 기준)의 연료를 절감할 수 있고 약 33만원의 비용 절감의 효과가 있습니다. 이는 연간 469.4kg의 이산화탄소를 줄일 수 있는 양으로 30년생 소나무 약 71그루를 식재하는 효과입니다.',
      false,
      3,
    ],
    [
      '천연세제 사용하기!',
      '천연세제를 이용하는 모습을 찍어주세요 ',
      '천연 세제는 주로 식물 기반 원료로 만들어지며, 이는 빠르게 자연에 분해되어 환경에 부담을 주지 않습니다. 반면에 합성 화학 물질로 만들어진 일반 세제는 자연 분해가 어려울 수 있으며 사용할 때 휘발성 유기 화합물 (VOCs)을 방출할 수 있습니다. 이러한 화합물은 대기 오염의 원인이 될 수 있습니다.',
      false,
      4,
    ],
    [
      '헌 옷 기부하기!',
      '헌 옷을 폐기하지 않고 기부하는 모습을 찍어주세요',
      '헌 옷을 버리는 과정에서 옷이 썩으면 이산화탄소와 메탄 등 유독가스가 배출됩니다. 이렇게 버려진 옷으로 인한 전 세계 탄소배출량은 연간 120억 톤. 전 세계 온실가스 배출량의 10%에 달하는 수치입니다.',
      false,
      5,
    ],

    [
      '리필형 제품 구매하기',
      '새로운 플라스틱 용기에 담긴 제품이 아닌 리필형 제품을 구매하는 모습을 찍어주세요',
      '슈퍼에 가면 세탁 세제, 바디 워시, 샴푸 등, 거의 모든 것이 플라스틱 안에 담겨있습니다. 플라스틱 통이 아닌 리필형이 있다면 그 제품을 선택하거나, 이미 집에 있는 빈 플라스틱 용기를 최대한 활용하면 그만큼 소비하는 플라스틱 양도 줄일 수 있을 것입니다.',
      false,
      6,
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
