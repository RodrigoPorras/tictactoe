part of 'enums.dart';

enum Turn {
  player1('o'),
  player2('x');

  const Turn(this.mark);
  final String mark;
}
