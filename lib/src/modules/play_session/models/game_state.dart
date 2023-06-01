part of 'enums.dart';

enum GameState {
  idle,
  playing,
  win,
  tie;

  bool isWinOrTie() => index == 2 || index == 3;
}
