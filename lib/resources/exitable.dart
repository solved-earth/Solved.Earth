import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app/models/scope.dart';

export 'package:app/models/scope.dart';

// A function signature for the callback that can be triggered when the exitable event occurs
typedef ExitableCallback<T> = void Function(T);

class Exitable extends StatefulWidget {
  const Exitable({
    super.key,
    this.scopes,
    required this.onExitable,
    required this.child,
  });

  final List<ExitScope>? scopes; // List of exitable scopes
  final ExitableCallback<ExitScope>?
      onExitable; // Callback function for exitable events
  final Widget child; // Child widget of the Exitable widget

  @override
  State<Exitable> createState() => _ExitableState();
}

class _ExitableState extends State<Exitable> {
  StreamSubscription<ExitScope>?
      _subscription; // Variable to hold the stream subscription

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // If the onExitable callback is not null
    if (widget.onExitable != null) {
      _subscription?.cancel(); // Cancel any existing subscription

      // Set up the stream and filter events based on exitable scopes
      final stream = (widget.scopes?.isEmpty ??
              true) // Use the exitable scope stream directly if the list is empty
          ? ExitScope.stream
          : ExitScope.stream.where((e) => widget.scopes!.contains(e));

      // Start listening to the stream and detect events related to exitable scopes
      _subscription = stream.listen(widget.onExitable);
    }
  }

  @override
  void didUpdateWidget(Exitable oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the current onExitable is different from the previous one and there's an existing subscription
    if (widget.onExitable != oldWidget.onExitable && _subscription != null) {
      // If the previous onExitable is not null, cancel the previous subscription
      if (oldWidget.onExitable != null) {
        _subscription!.cancel(); // Cancel previous subscription
      }

      // Set up the stream and filter events based on exitable scopes
      // If the current onExitable is not null
      if (widget.onExitable != null) {
        final stream = (widget.scopes?.isEmpty ?? true)
            ? ExitScope.stream
            : ExitScope.stream.where((e) => widget.scopes!.contains(e));

        // Start listening to the stream and detect events related to exitable scopes
        _subscription = stream.listen(widget.onExitable);
      }
    }
  }

  @override
  void dispose() {
    if (widget.onExitable != null) {
      _subscription?.cancel(); // Cancel the subscription
    }
    super.dispose();
  }

  @override
  // Return the child widget
  Widget build(BuildContext context) => widget.child;
}
