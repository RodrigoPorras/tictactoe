import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tictactoe/src/config/audio/providers/audio_controller_provider.dart';
import 'package:tictactoe/src/modules/play_session/components/board_widget.dart';
import 'package:tictactoe/src/modules/play_session/components/square_widget.dart';
import 'package:tictactoe/src/modules/play_session/models/enums.dart';
import 'package:tictactoe/src/modules/play_session/providers/game_controller_provider.dart';
import 'package:tictactoe/src/modules/play_session/views/play_session_view.dart';

import '../../../../mocks/mocks.mocks.dart';

void main() {
  group('PlaySessionView Test', () {
    late MockAudioController audioController;
    late MockGameController gameController;

    setUp(() {
      audioController = MockAudioController();
      gameController = MockGameController();
    });

    MaterialApp getApp() {
      return MaterialApp(
        home: AudioControllerProvider(
          audioController: audioController..initialize(),
          child: GameControllerProvider(
            gameController: gameController,
            child: const SingleChildScrollView(
              child: SizedBox(
                width: 800,
                height: 1000,
                child: PlaySessionView(),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('Initial UI', (WidgetTester tester) async {
      when(gameController.playerTurn).thenReturn(Turn.player1);
      when(gameController.gameState).thenReturn(GameState.playing);
      when(gameController.board).thenReturn(<List<String>>[
        ['x', 'o', 'x'],
        ['o', '', 'o'],
        ['o', '', 'x']
      ]);

      await tester.pumpWidget(getApp());

      // Verify the presence of RoundedButton widgets
      expect(find.byWidgetPredicate((widget) => widget is ElevatedButton),
          findsNWidgets(2));

      // Verify the presence of BoardWidget widget
      expect(find.byType(BoardWidget), findsOneWidget);

      // Verify the presence of GestureDetector widget with Reiniciar or Inicia la partida
      expect(
          find.byWidgetPredicate(
              (widget) => widget is GestureDetector && widget.child is Text),
          findsOneWidget);

      // Verify the presence of Image widget with pragma logo
      expect(
          find.byWidgetPredicate(
              (widget) => widget is Padding && widget.child is Image),
          findsOneWidget);
    });

    testWidgets('Restart Game', (WidgetTester tester) async {
      when(gameController.playerTurn).thenReturn(Turn.player2);
      when(gameController.gameState).thenReturn(GameState.playing);
      when(gameController.board).thenReturn(<List<String>>[
        ['x', '', 'x'],
        ['o', '', 'o'],
        ['o', '', '']
      ]);

      when(gameController.restartGame()).thenAnswer((realInvocation) => null);

      await tester.pumpWidget(getApp());

      // Tap the restart button
      await tester.tap(find.text('Reiniciar'));
      await tester.pumpAndSettle();

      // Verify that restartGame() is called on GameController
      verify(gameController.restartGame()).called(1);
    });

    testWidgets('Square Was Pressed', (WidgetTester tester) async {
      when(gameController.playerTurn).thenReturn(Turn.player1);
      when(gameController.gameState).thenReturn(GameState.playing);
      when(gameController.board).thenReturn(<List<String>>[
        ['x', 'o', 'x'],
        ['o', '', 'o'],
        ['o', '', 'x']
      ]);

      when(gameController.squareWasPressed(any, any))
          .thenAnswer((realInvocation) => null);

      await tester.pumpWidget(getApp());

      // Tap a square in BoardWidget
      await tester.tap(find.byType(SquareWidget).first);
      await tester.pumpAndSettle();

      // Verify that squareWasPressed() is called on GameController
      verify(gameController.squareWasPressed(any, any)).called(1);
    });
  });
}
