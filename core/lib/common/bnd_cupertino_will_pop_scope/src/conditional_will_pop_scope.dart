import 'dart:io';

import 'package:flutter/material.dart';

class ConditionalWillPopScope extends StatefulWidget {
  const ConditionalWillPopScope({
    Key? key,
    required this.child,
    required this.onWillPop,
    this.shouldAddCallback = true,
  }) : super(key: key);

  final Widget child;

  final WillPopCallback? onWillPop;

  final bool shouldAddCallback;

  @override
  State<ConditionalWillPopScope> createState() => _ConditionalWillPopScopeState();
}

class _ConditionalWillPopScopeState extends State<ConditionalWillPopScope> {
  bool get isPlatformIOS => Platform.isIOS;

  @override
  Widget build(BuildContext context) => _buildWidget();

  Widget _buildWidget() {
    if (isPlatformIOS) {
      return BndWillPopScopeWidget(
        child: widget.child,
        onWillPop: widget.onWillPop,
        shouldAddCallback: widget.shouldAddCallback,
      );
    }
    return WillPopScope(child: widget.child, onWillPop: widget.onWillPop);
  }
}

class BndWillPopScopeWidget extends StatefulWidget {
  /// Creates a widget that registers a callback to veto attempts by the user to
  /// dismiss the enclosing [ModalRoute].
  ///
  /// The `child` argument must not be `null`.
  const BndWillPopScopeWidget({
    Key? key,
    required this.child,
    required this.onWillPop,
    this.shouldAddCallback = true,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  final Widget child;

  /// Called to veto attempts by the user to dismiss the enclosing [ModalRoute].
  ///
  /// If the callback returns a [Future] that resolves to `false`, the enclosing
  /// route will not be popped.
  final WillPopCallback? onWillPop;

  /// Determines if the `onWillPop` callback should be added to the enclosing [ModalRoute].
  final bool shouldAddCallback;

  @override
  State<BndWillPopScopeWidget> createState() => _BndWillPopScopeWidgetState();
}

class _BndWillPopScopeWidgetState extends State<BndWillPopScopeWidget> {
  ModalRoute<dynamic>? _route;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.onWillPop != null) {
      // Remove callback from the "old" route.
      _route?.removeScopedWillPopCallback(widget.onWillPop!);

      // Update the reference to the "current" route.
      _route = ModalRoute.of(context);

      // Add the callbacks to the new "current" route.
      if (widget.shouldAddCallback)
        _route?.addScopedWillPopCallback(widget.onWillPop!);
      else
        _route!.willDisposeAnimationController = false;
    }
  }

  @override
  void didUpdateWidget(BndWillPopScopeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.onWillPop != oldWidget.onWillPop || widget.shouldAddCallback != oldWidget.shouldAddCallback) {
      assert(_route == ModalRoute.of(context));
      // Remove callbacks of the old widget state.
      if (oldWidget.onWillPop != null) _route?.removeScopedWillPopCallback(oldWidget.onWillPop!);

      // Add callbacks of the new widget state.
      if (widget.onWillPop != null && widget.shouldAddCallback) {
        _route!.willDisposeAnimationController = true;
        _route?.addScopedWillPopCallback(widget.onWillPop!);
      } else {
        _route!.willDisposeAnimationController = false;
      }
    }
  }

  @override
  void dispose() {
    if (widget.onWillPop != null) _route?.removeScopedWillPopCallback(widget.onWillPop!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
