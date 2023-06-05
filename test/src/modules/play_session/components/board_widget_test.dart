import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/src/modules/play_session/components/board_widget.dart';
import 'package:tictactoe/src/modules/play_session/components/square_widget.dart';

void main() {
  testWidgets('BoardWidget Test', (WidgetTester tester) async {
    final List<List<String>> currentBoard = [
      ['x', 'o', 'x'],
      ['o', 'x', 'o'],
      ['o', '', '']
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: BoardWidget(
          currentBoard: currentBoard,
          onSquareSelected: (int x, int y) {},
        ),
      ),
    );

    // Verify the number of SquareWidgets in the board
    expect(find.byType(SquareWidget), findsNWidgets(9));

    // Verify the presence of GridView in the board
    expect(find.byType(GridView), findsOneWidget);
  });
}
