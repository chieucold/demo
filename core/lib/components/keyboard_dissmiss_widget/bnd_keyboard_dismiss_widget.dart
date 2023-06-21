import 'package:flutter/widgets.dart';

/// Removes the current focus and hides the keyboard when
/// the user taps on this widget.
///
/// Place this widget somewhere near the top of your widget
/// tree and when the user taps outside of a focused widget,
/// the focus will be removed and the keyboard will be hidden.
class BndKeyboardDismissWidget extends StatefulWidget {
  /// Determines whether taps captures by other [Widget]s should dismiss the
  /// keyboard. Defaults to false.
  ///
  /// A common example of this is buttons. By default buttons
  /// capture the tap event and the keyboard won't be dismissed.
  final bool dismissOnCapturedTaps;

  const BndKeyboardDismissWidget({

    Key? key,
    required this.child,
    this.dismissOnCapturedTaps = false,
  }) : super(key: key);

  final Widget child;


  @override
  State<BndKeyboardDismissWidget> createState() => _BndKeyboardDismissWidgetState();

  /// Used internally by [IgnoreKeyboardDismiss] to notify this Widget to ignore
  /// the next tap.
  static void ignoreNextTap(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<_KeyboardDismissOnTapInheritedWidget>()!.ignoreNextTap();
  }
}

class _BndKeyboardDismissWidgetState extends State<BndKeyboardDismissWidget> {
  bool ignoreNextTap = false;
   bool isFocus = false;

  void _hideKeyboard(BuildContext context) {
    if (isFocus) {
      ignoreNextTap = true;
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (bool focused){
        isFocus = focused;
      },
      child: _KeyboardDismissOnTapInheritedWidget(
        ignoreNextTap: () {
          ignoreNextTap = true;
        },
        child: !widget.dismissOnCapturedTaps
            ? GestureDetector(
                onTap: () {
                  _hideKeyboard(context);
                },
                child: widget.child,
              )
            : Listener(
                onPointerUp: (_) {
                  // _hideKeyboard(context);
                },
                onPointerMove: (_) {
                  // _hideKeyboard(context);
                },
                onPointerDown: (_) {
                  // print('onPointerDown');
                  _hideKeyboard(context);
                },
                behavior: HitTestBehavior.translucent,
                child: widget.child,
              ),
      ),
    );
  }
}

/// Used to ignore keyboard dismiss requests for a specific Widget or Widget
/// tree.
class IgnoreKeyboardDismiss extends StatelessWidget {
  final Widget child;

  const IgnoreKeyboardDismiss({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) {
        BndKeyboardDismissWidget.ignoreNextTap(context);
      },
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}

/// Used internally by [KeyboardDismissOnTap] and [IgnoreKeyboardDismiss] to
/// communicate ignore requests.
class _KeyboardDismissOnTapInheritedWidget extends InheritedWidget {
  _KeyboardDismissOnTapInheritedWidget({
    Key? key,
    required this.ignoreNextTap,
    required Widget child,
  }) : super(key: key, child: child);

  final VoidCallback ignoreNextTap;

  @override
  bool updateShouldNotify(_KeyboardDismissOnTapInheritedWidget oldWidget) {
    return false;
  }
}
