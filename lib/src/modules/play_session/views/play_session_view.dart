import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/src/modules/play_session/components/board_widget.dart';
import 'package:tictactoe/src/modules/play_session/controllers/game_controller.dart';

class PlaySessionView extends StatelessWidget {
  const PlaySessionView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameController())
      ],
      child: Builder(builder: (context) {
        final gameController = context.watch<GameController>();
        return Material(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    circularButton('Jugador 1 O'),
                    const SizedBox(width: 20.0),
                    circularButton('Jugador 2 X')
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Inicia la partida'),
                ),
                Center(
                  child: BoardWidget(
                    currentBoard: gameController.board,
                    onSquareSelected:
                        context.read<GameController>().squareWasPressed,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget circularButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(100.0), // Establecer el radio deseado
        ),
      ),
      child: Text(label),
    );
  }
}
