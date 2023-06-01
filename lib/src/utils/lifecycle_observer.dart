import 'package:flutter/material.dart';

class LifecycleObserver extends WidgetsBindingObserver {
  final VoidCallback? onResume;
  final VoidCallback? onSuspending;
  final VoidCallback? onInactive;
  final VoidCallback? onPaused;

  LifecycleObserver({
    this.onResume,
    this.onSuspending,
    this.onInactive,
    this.onPaused,
  });

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResume?.call();
        break;
      case AppLifecycleState.detached:
        onSuspending?.call();
        break;
      case AppLifecycleState.inactive:
        onInactive?.call();
        break;
      case AppLifecycleState.paused:
        onPaused?.call();
        break;
    }
  }
}
