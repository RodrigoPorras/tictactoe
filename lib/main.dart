import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/src/config/audio/audio_controller.dart';
import 'package:tictactoe/src/config/router/app_router.dart';
import 'package:tictactoe/src/res/palette.dart';

import 'src/modules/play_session/controllers/game_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          lazy: false,
          create: (context) => AudioController()..initialize(),
        ),
        ChangeNotifierProvider(create: (context) => GameController()),
      ],
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
    );
  }
}
