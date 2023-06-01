import 'package:flutter/material.dart';
import 'package:tictactoe/src/modules/play_session/components/square_widget.dart';
import 'package:tictactoe/src/res/palette.dart';

class BoardWidget extends StatelessWidget {
  final List<List<String>> currentBoard;

  const BoardWidget(
      {super.key, required this.currentBoard, required this.onSquareSelected});

  final double padding = 52.0;

  final double lineSize = 10.0;

  final Function(int x, int y) onSquareSelected;

  @override
  Widget build(BuildContext context) {
    final mainSquareSize = MediaQuery.of(context).size.width - (padding * 2);

    final newMatrixToList = List.generate(
      currentBoard.length,
      (x) {
        return List.generate(
          currentBoard[0].length,
          (y) => GestureDetector(
            onTap: () => onSquareSelected.call(x, y),
            child: SquareWidget(assetName: currentBoard[x][y]),
          ),
        ).toList();
      },
    ).expand((listString) => listString).toList();

    return SizedBox(
      height: mainSquareSize,
      width: mainSquareSize,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: lineSize,
              mainAxisSpacing: lineSize,
            ),
            children: newMatrixToList,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              line(horizontal: false),
              line(horizontal: false),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              line(),
              line(),
            ],
          )
        ],
      ),
    );
  }

  Widget line({bool horizontal = true}) {
    return Container(
      decoration: BoxDecoration(
          color: palette.lineColor, borderRadius: BorderRadius.circular(8.0)),
      height: horizontal ? lineSize : null,
      width: horizontal ? null : lineSize,
    );
  }
}
