import 'package:flutter/material.dart';
import 'package:tictactoe/src/modules/play_session/models/square.dart';

class PlaySessionView extends StatefulWidget {
  const PlaySessionView({super.key});

  @override
  State<PlaySessionView> createState() => _PlaySessionViewState();
}

class _PlaySessionViewState extends State<PlaySessionView> {
  final double padding = 20.0;

  final double lineSize = 10.0;

  List<Square> gridSquared = List.generate(9, (index) => Square());

  @override
  Widget build(BuildContext context) {
    final mainSquareSize = MediaQuery.of(context).size.width - (padding * 2);

    return Material(
      color: const Color.fromARGB(255, 155, 106, 151),
      child: SafeArea(
        child: Center(
          child: SizedBox(
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
                  children: List.generate(
                      9, (index) => square(gridSquared[index].value, index)),
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
          ),
        ),
      ),
    );
  }

  Widget square(String squareValue, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          gridSquared[index] =
              gridSquared[index].copyWith(pressed: true, value: 'X');
        });
      },
      child: Container(
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          squareValue,
          style: TextStyle(fontSize: 80),
        ),
      ),
    );
  }

  Widget line({bool horizontal = true}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(8.0)),
      height: horizontal ? lineSize : null,
      width: horizontal ? null : lineSize,
    );
  }
}
