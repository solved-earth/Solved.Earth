import 'package:flutter/material.dart';
import 'package:app/resources/exitable.dart';

// Function to create a custom PageRouteBuilder with slide transition.
PageRouteBuilder pageRouteBuilder({
  required Widget page, // The widget representing the destination page.
  ExitScope? scope =
      ExitScope.openedPageRouteBuilder, // Scope for exit transition.
  Offset offset = const Offset(1.0, 0.0), // Offset for slide transition.
}) {
  if (scope != null) {
    ExitScope.add = scope; // Set the provided exit scope if available.
  }
  // Return a custom PageRouteBuilder with slide transition.
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page, // The builder for the destination page.
    transitionDuration:
        const Duration(milliseconds: 200), // Transition duration.
    reverseTransitionDuration:
        const Duration(milliseconds: 200), // Reverse transition duration.
    opaque: false,
    transitionsBuilder: (context, animation, __, child) {
      // Slide transition using the provided offset and curve.
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: offset,
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.ease)),
        ),
        child: child, // The child widget being transitioned.
      );
    },
  );
}
