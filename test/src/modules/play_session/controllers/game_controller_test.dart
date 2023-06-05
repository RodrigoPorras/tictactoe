import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/src/modules/play_session/controllers/game_controller.dart';
import 'package:tictactoe/src/modules/play_session/models/enums.dart';

void main() {
  group('GameController', () {
    late GameController gameController;

    setUp(() {
      gameController = GameController();
    });

    test('Initial state', () {
      expect(gameController.board, [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ]);
      expect(gameController.playerTurn, Turn.player1);
      expect(gameController.gameState, GameState.idle);
    });

    test('Square pressed with idle game state', () {
      gameController.squareWasPressed(0, 0);
      expect(gameController.board[0][0], '');
      expect(gameController.playerTurn, Turn.player1);
      expect(gameController.gameState, GameState.idle);
    });

    test('Square pressed with non-empty cell', () {
      gameController.board[0][0] = 'x';
      gameController.playerTurn = Turn.player1;
      gameController.squareWasPressed(0, 0);
      expect(gameController.board[0][0], 'x');
      expect(gameController.playerTurn, Turn.player1);
      expect(gameController.gameState, GameState.idle);
    });

    test('Square pressed with playing game state', () {
      gameController.gameState = GameState.playing;
      gameController.squareWasPressed(0, 0);
      expect(gameController.board[0][0], 'o');
      expect(gameController.playerTurn, Turn.player2);
      expect(gameController.gameState, GameState.playing);
    });

    test('Square pressed and wins the game', () {
      gameController.gameState = GameState.playing;
      gameController.board = [
        ['x', 'x', ''],
        ['o', 'o', ''],
        ['', '', ''],
      ];
      gameController.squareWasPressed(1, 2);
      expect(gameController.board[1][2], 'o');
      expect(gameController.playerTurn, Turn.player1);
      expect(gameController.gameState, GameState.win);
    });

    test('Square pressed and ties the game', () {
      gameController.gameState = GameState.playing;
      gameController.playerTurn = Turn.player2;
      gameController.board = [
        ['x', 'o', 'x'],
        ['x', '0', 'o'],
        ['o', 'x', ''],
      ];
      gameController.squareWasPressed(2, 2);
      expect(gameController.board[2][2], 'x');
      expect(gameController.playerTurn, Turn.player2);
      expect(gameController.gameState, GameState.tie);
    });

    test('Restart game', () {
      gameController.board = [
        ['x', 'o', 'x'],
        ['x', 'o', 'o'],
        ['o', 'x', ''],
      ];
      gameController.playerTurn = Turn.player2;
      gameController.gameState = GameState.win;
      gameController.restartGame();
      expect(gameController.board, [
        ['', '', ''],
        ['', '', ''],
        ['', '', ''],
      ]);
      expect(gameController.playerTurn, Turn.player1);
      expect(gameController.gameState, GameState.playing);
    });

    test('Check win with no win', () {
      gameController.board = [
        ['x', 'o', 'x'],
        ['x', 'o', 'o'],
        ['o', 'x', ''],
      ];
      expect(gameController.checkWin(), false);
    });

    test('Check win with horizontal win', () {
      gameController.board = [
        ['x', 'x', 'x'],
        ['o', 'o', ''],
        ['', '', ''],
      ];
      expect(gameController.checkWin(), true);
    });

    test('Check win with vertical win', () {
      gameController.board = [
        ['x', 'o', ''],
        ['x', 'o', ''],
        ['x', '', ''],
      ];
      expect(gameController.checkWin(), true);
    });

    test('Check win with diagonal win', () {
      gameController.board = [
        ['x', 'o', ''],
        ['o', 'x', ''],
        ['', '', 'x'],
      ];
      expect(gameController.checkWin(), true);
    });
  });
}
