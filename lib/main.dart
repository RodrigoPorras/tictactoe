import 'package:flutter/material.dart';
import 'package:tictactoe/src/config/router/app_router.dart';
import 'package:tictactoe/src/res/palette.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
