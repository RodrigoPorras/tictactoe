import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/src/modules/play_session/views/play_session_view.dart';

class AppRouter {
  final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const PlaySessionView(
        key: Key('play session'),
      ),
    )
  ]);
}

final appRouter = AppRouter();
