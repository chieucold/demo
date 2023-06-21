import 'package:alice/alice.dart';
import 'package:flutter/material.dart';

class BNDAlice {
  static final Alice _aliceCore = Alice(showNotification: false, showInspectorOnShake: true);

  static Alice setAndGetAlice(GlobalKey<NavigatorState>? navigatorKey) {
    _aliceCore.setNavigatorKey(navigatorKey!);
    return _aliceCore;
  }

  static void showScreen() {
    _aliceCore.showInspector();
  }

  static void showAliceOverlay(BuildContext context) async {
    final OverlayState? overlayState = Overlay.of(context);
    final OverlayEntry overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
              bottom: 0.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  _aliceCore.showInspector();
                },
                child: const CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.blue,
                  child: Text("A"),
                ),
              ),
            ));
    overlayState!.insert(overlayEntry);
    await Future<void>.delayed(const Duration(days: 365));
    overlayEntry.remove();
  }
}
