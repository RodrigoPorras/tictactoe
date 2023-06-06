import 'package:flutter/material.dart';
import 'package:tictactoe/src/config/audio/providers/audio_controller_provider.dart';
import 'package:tictactoe/src/config/audio/sounds.dart';
import 'package:tictactoe/src/modules/play_session/components/board_widget.dart';
import 'package:tictactoe/src/modules/play_session/models/enums.dart';
import 'package:tictactoe/src/modules/play_session/providers/game_controller_provider.dart';
import 'package:tictactoe/src/res/dimens.dart';
import 'package:tictactoe/src/res/palette.dart';

class PlaySessionView extends StatelessWidget {
  const PlaySessionView({super.key});

  @override
  Widget build(BuildContext context) {
    final audioController =
        AudioControllerProvider.of(context)!.audioController;

    final gameController = GameControllerProvider.of(context)!.gameController;

    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    roundedButton(
                      'Jugador 1 O',
                      gameController.playerTurn == Turn.player1,
                    ),
                    sizedBoxW20,
                    roundedButton(
                      'Jugador 2 X',
                      gameController.playerTurn == Turn.player2,
                    )
                  ],
                ),
                sizedBoxH44,
                GestureDetector(
                  onTap: () {
                    audioController.playSfx(SfxType.buttonTap);
                    gameController.restartGame();
                  },
                  child: Text(
                    gameController.gameState == GameState.playing
                        ? 'Reiniciar'
                        : 'Inicia la partida',
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                sizedBoxH56,
                if (!gameController.gameState.isWinOrTie())
                  Center(
                    child: BoardWidget(
                      currentBoard: gameController.board,
                      onSquareSelected: (x, y) {
                        audioController.playSfx(SfxType.squareTap);
                        gameController.squareWasPressed(x, y);
                      },
                    ),
                  )
                else
                  const Spacer(flex: 3),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Image.asset('assets/png/pragma.png'),
                )
              ],
            ),
            if (gameController.gameState.isWinOrTie())
              tieOrWinPopUp(
                isWin: gameController.gameState == GameState.win,
                (gameController.playerTurn.index + 1).toString(),
              )
          ],
        ),
      ),
    );
  }

  Widget tieOrWinPopUp(String playerWin, {required bool isWin}) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: palette.container,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(33),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_rounded,
              size: 30,
            ),
            sizedBoxW9,
            Flexible(
              child: Text(
                isWin ? 'Ganador Jugador $playerWin' : 'Empate',
                style: const TextStyle(fontSize: 55),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget roundedButton(String label, bool enable) {
    return ElevatedButton(
      onPressed: enable ? () {} : null,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        disabledBackgroundColor: palette.disableButton,
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
