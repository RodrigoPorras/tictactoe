import 'package:flutter/material.dart';
import 'package:tictactoe/src/config/audio/audio_controller.dart';
import 'package:tictactoe/src/config/audio/providers/audio_controller_provider.dart';

class AudioControllerWidget extends StatefulWidget {
  final Widget child;

  const AudioControllerWidget({super.key, required this.child});

  @override
  State<AudioControllerWidget> createState() => _AudioControllerWidgetState();
}

class _AudioControllerWidgetState extends State<AudioControllerWidget> {
  final _audioController = AudioController();

  @override
  Widget build(BuildContext context) {
    return AudioControllerProvider(
      audioController: _audioController..initialize(),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _audioController.dispose();
    super.dispose();
  }
}
