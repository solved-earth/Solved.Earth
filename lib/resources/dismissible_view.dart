import 'package:flutter/material.dart';
import 'package:dismissible_page/dismissible_page.dart';

class DismissibleView extends StatelessWidget {
  const DismissibleView({
    super.key,
    required this.onDismissed,
    this.direction = DismissiblePageDismissDirection.startToEnd,
    this.maxTransformValue = 1,
    this.dismissThresholds = const <DismissiblePageDismissDirection, double>{},
    required this.child,
  });
  final void Function() onDismissed;
  final DismissiblePageDismissDirection direction;
  final double maxTransformValue;
  final Map<DismissiblePageDismissDirection, double> dismissThresholds;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: onDismissed,
      direction: direction,
      minScale: 1,
      minRadius: 0,
      maxRadius: 0,
      backgroundColor: Colors.transparent,
      dragSensitivity: 1,
      maxTransformValue: maxTransformValue,
      dismissThresholds: dismissThresholds,
      child: child,
    );
  }
}
