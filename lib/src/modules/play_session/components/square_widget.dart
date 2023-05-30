import 'package:flutter/material.dart';

class SquareWidget extends StatelessWidget {
  const SquareWidget({
    super.key,
    required this.squareValue,
  });

  final String squareValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Text(
        squareValue,
        style: const TextStyle(fontSize: 80),
      ),
    );
  }
}
