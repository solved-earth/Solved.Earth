import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app/models/scope.dart';

export 'package:app/models/scope.dart';

typedef ExitableCallback<T> = void Function(T);

class Exitable extends StatefulWidget {
  const Exitable({
    super.key,
    this.scopes,
    required this.onExitable,
    required this.child,
  });

  final List<ExitScope>? scopes; // 종료 가능한 범위 리스트
  final ExitableCallback<ExitScope>? onExitable; // 종료 가능한 범위에 대한 콜백 함수
  final Widget child; // Exitable 위젯의 자식 위젯

  @override
  State<Exitable> createState() => _ExitableState();
}

class _ExitableState extends State<Exitable> {
  StreamSubscription<ExitScope>? _subscription; // 스트림 구독을 위한 변수

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 만약 onExitable 콜백이 null이 아니라면
    if (widget.onExitable != null) {
      _subscription?.cancel(); // 기존 구독 취소

      // 스트림을 설정하고, 종료 가능한 범위에 따라 이벤트 필터링
      final stream = (widget.scopes?.isEmpty ??
              true) // 만약 종료 가능한 범위 리스트가 비어있으면 true 반환 = 종료 가능한 범위가 없으면 true 반환
          ? ExitScope.stream // 종료 가능한 범위 스트림을 그대로 사용
          : ExitScope.stream.where(
              (e) => widget.scopes!.contains(e)); // 종료 가능한 범위 중에서 필요한 범위 선택.

      // 스트림 구독 시작 및 종료 가능한 범위에 대한 이벤트를 감지
      _subscription = stream.listen(widget.onExitable);
    }
  }

  @override
  void didUpdateWidget(Exitable oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 만약 이전과 현재의 onExitable이 다르고, 구독이 존재하면
    if (widget.onExitable != oldWidget.onExitable && _subscription != null) {
      // 만약 이전 onExitable이 null이 아니면
      if (oldWidget.onExitable != null) {
        _subscription!.cancel(); // 이전 구독 취소
      }

      // 스트림을 설정하고, 종료 가능한 범위에 따라 이벤트 필터링
      // 만약 현재 onExitable이 null 아니면
      if (widget.onExitable != null) {
        final stream = (widget.scopes?.isEmpty ??
                true) // 종료 가능한 범위가 없으면 true 반환
            ? ExitScope.stream // 종료 가능한 범위 스트림을 그대로 사용
            : ExitScope.stream.where(
                (e) => widget.scopes!.contains(e)); // 종료 가능한 범위 중에서 필요한 범위 선택.

        // 스트림 구독 시작 및 종료 가능한 범위에 대한 이벤트를 감지
        _subscription = stream.listen(widget.onExitable);
      }
    }
  }

  @override
  void dispose() {
    if (widget.onExitable != null) {
      _subscription?.cancel(); // 구독 취소
    }
    super.dispose();
  }

  @override
  //widget.child 반환
  Widget build(BuildContext context) => widget.child;
}
