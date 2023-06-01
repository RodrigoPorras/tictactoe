import 'package:flutter/material.dart';
import 'package:tictactoe/src/modules/play_session/models/enums.dart';

class GameController extends ChangeNotifier {
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  Turn playerTurn = Turn.player1;

  GameState gameState = GameState.idle;

  squareWasPressed(int x, int y) {
    if (!(gameState == GameState.playing) || board[x][y].isNotEmpty) return;

    board[x][y] = playerTurn.mark;

    if (checkWin()) {
      gameState = GameState.win;
    } else if (!board.expand((list) => list).any((value) => value.isEmpty)) {
      gameState = GameState.tie;
    }

    if (!gameState.isWinOrTie()) {
      playerTurn = playerTurn == Turn.player1 ? Turn.player2 : Turn.player1;
    }

    notifyListeners();
  }

  restartGame() {
    board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', ''],
    ];
    playerTurn = Turn.player1;
    gameState = GameState.playing;
    notifyListeners();
  }

  bool checkWin() {
    for (var pattern in winningPatterns) {
      if (board[pattern[0][0]][pattern[0][1]] != '' &&
          board[pattern[0][0]][pattern[0][1]] ==
              board[pattern[1][0]][pattern[1][1]] &&
          board[pattern[0][0]][pattern[0][1]] ==
              board[pattern[2][0]][pattern[2][1]]) {
        return true;
      }
    }
    return false;
  }
}

List<List<List<int>>> winningPatterns = [
  // Líneas horizontales
  [
    [0, 0],
    [0, 1],
    [0, 2]
  ],
  [
    [1, 0],
    [1, 1],
    [1, 2]
  ],
  [
    [2, 0],
    [2, 1],
    [2, 2]
  ],

  // Líneas verticales
  [
    [0, 0],
    [1, 0],
    [2, 0]
  ],
  [
    [0, 1],
    [1, 1],
    [2, 1]
  ],
  [
    [0, 2],
    [1, 2],
    [2, 2]
  ],

  // Líneas diagonales
  [
    [0, 0],
    [1, 1],
    [2, 2]
  ],
  [
    [0, 2],
    [1, 1],
    [2, 0]
  ],
];
