import 'package:flutter/material.dart';
import 'package:dismissible_page/dismissible_page.dart';

// A widget that wraps a child widget and makes it dismissible with customizable properties
class DismissibleView extends StatelessWidget {
  const DismissibleView({
    super.key,
    required this.onDismissed, // Callback triggered when the widget is dismissed
    this.direction = DismissiblePageDismissDirection
        .startToEnd, // Dismiss direction (default is left to right)
    this.maxTransformValue = 1, // Maximum transformation value during dismissal
    this.dismissThresholds = const <DismissiblePageDismissDirection,
        double>{}, // Thresholds for dismissal in different directions
    required this.child, // Child widget that is being made dismissible
  });
  final void Function() onDismissed; // Callback for dismissed event
  final DismissiblePageDismissDirection direction; // Direction of dismissal
  final double maxTransformValue; // Maximum transformation value
  final Map<DismissiblePageDismissDirection, double>
      dismissThresholds; // Thresholds for dismissal
  final Widget child; // Child widget to be made dismissible

  @override
  Widget build(BuildContext context) {
    // Create a DismissiblePage widget that wraps the child widget and provides dismissible behavior
    return DismissiblePage(
      onDismissed: onDismissed,
      direction: direction,
      minScale: 1, // Minimum scale factor during dismissal
      minRadius: 0, // Minimum radius during dismissal
      maxRadius: 0, // Maximum radius during dismissal
      backgroundColor: Colors.transparent, // Background color during dismissal
      dragSensitivity: 1, // Drag sensitivity for dismissal
      maxTransformValue: maxTransformValue,
      dismissThresholds: dismissThresholds,
      child: child,
    );
  }
}
