import 'package:expense_tracker/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 112, 60, 204),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 180, 150, 235),
          foregroundColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 4,
          backgroundColor: Color.fromARGB(255, 180, 150, 235),
          foregroundColor: Colors.white,
        ),
        cardTheme: const CardThemeData(elevation: 3),
      ),
      home: MainScreen(),
    );
  }
}
