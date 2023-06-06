import 'package:flutter/material.dart';
import 'package:tictactoe/src/config/audio/audio_controller.dart';

class AudioControllerProvider extends InheritedWidget {
  final AudioController audioController;

  const AudioControllerProvider({
    required this.audioController,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static AudioControllerProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AudioControllerProvider>();

  @override
  bool updateShouldNotify(covariant AudioControllerProvider oldWidget) {
    return oldWidget.audioController != audioController;
  }
}
