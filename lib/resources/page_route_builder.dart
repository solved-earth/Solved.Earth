import 'package:flutter/material.dart';
import 'package:app/resources/exitable.dart';

PageRouteBuilder pageRouteBuilder({
  required Widget page,
  ExitScope? scope = ExitScope.openedPageRouteBuilder,
  Offset offset = const Offset(1.0, 0.0),
}) {
  if (scope != null) {
    ExitScope.add = scope;
  }
  return PageRouteBuilder(
    pageBuilder: (_, __, ___) => page,
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
    opaque: false,
    transitionsBuilder: (context, animation, __, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(
            begin: offset,
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.ease)),
        ),
        child: child,
      );
    },
  );
}
