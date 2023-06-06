import 'package:flutter/material.dart';
import 'package:tictactoe/src/config/router/app_router.dart';
import 'package:tictactoe/src/res/palette.dart';

import 'src/config/audio/components/audio_controller_widget.dart';
import 'src/modules/play_session/controllers/game_controller.dart';
import 'src/modules/play_session/providers/game_controller_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AudioControllerWidget(
      child: GameControllerProvider(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Tic Tac Toe',
          theme: ThemeData.from(
            colorScheme: const ColorScheme.light().copyWith(
              primary: palette.primary,
              background: palette.backgroundMain,
              onPrimary: palette.onPrimary,
            ),
            textTheme: TextTheme(
              bodyMedium: TextStyle(color: palette.bodyMedium),
            ),
          ),
          routeInformationProvider: appRouter.router.routeInformationProvider,
          routeInformationParser: appRouter.router.routeInformationParser,
          routerDelegate: appRouter.router.routerDelegate,
        ),
      ),
    );
  }
}
