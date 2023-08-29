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

  final List<ExitScope>? scopes;

  final ExitableCallback<ExitScope>? onExitable;

  final Widget child;

  @override
  State<Exitable> createState() => _ExitableState();
}

class _ExitableState extends State<Exitable> {
  StreamSubscription<ExitScope>? _subscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.onExitable != null) {
      _subscription?.cancel();
      final stream = (widget.scopes?.isEmpty ?? true)
          ? ExitScope.stream
          : ExitScope.stream.where((e) => widget.scopes!.contains(e));
      _subscription = stream.listen(widget.onExitable);
    }
  }

  @override
  void didUpdateWidget(Exitable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onExitable != oldWidget.onExitable && _subscription != null) {
      if (oldWidget.onExitable != null) {
        _subscription!.cancel();
      }
      if (widget.onExitable != null) {
        final stream = (widget.scopes?.isEmpty ?? true)
            ? ExitScope.stream
            : ExitScope.stream.where((e) => widget.scopes!.contains(e));
        _subscription = stream.listen(widget.onExitable);
      }
    }
  }

  @override
  void dispose() {
    if (widget.onExitable != null) {
      _subscription?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
