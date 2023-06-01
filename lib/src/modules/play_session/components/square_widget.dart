import 'package:flutter/material.dart';

class SquareWidget extends StatelessWidget {
  const SquareWidget({
    super.key,
    required this.assetName,
  });

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      child: assetName.isNotEmpty
          ? Image.asset('assets/png/$assetName.png')
          : null,
    );
  }
}
