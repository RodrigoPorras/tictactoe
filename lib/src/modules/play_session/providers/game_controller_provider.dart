import 'package:flutter/material.dart';
import 'package:tictactoe/src/modules/play_session/controllers/game_controller.dart';

class GameControllerProvider extends StatefulWidget {
  static GameControllerInherited of(BuildContext context) {
    return GameControllerInherited.of(context)!;
  }

  final Widget child;

  const GameControllerProvider({super.key, required this.child});

  @override
  State<GameControllerProvider> createState() => _GameControllerProviderState();
}

class _GameControllerProviderState extends State<GameControllerProvider> {
  final _gameController = GameController();

  @override
  void initState() {
    _gameController.addListener(_onNotificationListened);
    super.initState();
  }

  void _onNotificationListened() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GameControllerInherited(
      gameController: _gameController,
      child: widget.child,
    );
  }
}

class GameControllerInherited extends InheritedWidget {
  final GameController gameController;

  const GameControllerInherited({
    required this.gameController,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static GameControllerInherited? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<GameControllerInherited>();

  @override
  bool updateShouldNotify(covariant GameControllerInherited oldWidget) {
    return true;
  }
}
