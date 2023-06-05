import 'package:mockito/annotations.dart';
import 'package:tictactoe/src/config/audio/audio_controller.dart';
import 'package:tictactoe/src/modules/play_session/controllers/game_controller.dart';

@GenerateMocks([
  AudioController,
  GameController,
])
void main() {}
