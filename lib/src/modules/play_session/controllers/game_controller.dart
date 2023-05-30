import 'package:flutter/material.dart';

class GameController extends ChangeNotifier {
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  squareWasPressed(int x, int y) {
    board[x][y] = 'X';

    if (checkWin()) {
      print('Ganó!!!1');
    }
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
