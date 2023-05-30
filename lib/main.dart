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
          bodyLarge: TextStyle(color: Colors.red),
          bodyMedium: TextStyle(color: Colors.red),
          bodySmall: TextStyle(color: Colors.red),
          labelSmall: TextStyle(color: Colors.red),
          titleSmall: TextStyle(color: Colors.red),
          displaySmall: TextStyle(color: Colors.red),
          headlineSmall: TextStyle(color: Colors.red),
          labelMedium: TextStyle(color: Colors.red),
          titleMedium: TextStyle(color: Colors.red),
          displayMedium: TextStyle(color: Colors.red),
          headlineMedium: TextStyle(color: Colors.red),
          displayLarge: TextStyle(color: Colors.red),
          labelLarge: TextStyle(color: Colors.red),
          titleLarge: TextStyle(color: Colors.red),
          headlineLarge: TextStyle(color: Colors.red),
        ),
      ),
      routeInformationProvider: appRouter.router.routeInformationProvider,
      routeInformationParser: appRouter.router.routeInformationParser,
      routerDelegate: appRouter.router.routerDelegate,
    );
  }
}
