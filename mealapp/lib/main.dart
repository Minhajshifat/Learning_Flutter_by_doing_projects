import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:mealapp/screens/tab_bar.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final colorscheme = ColorScheme.fromSeed(
  seedColor: Colors.indigo,
  brightness: Brightness.dark,
);

final theme = ThemeData(
  useMaterial3: true,

  colorScheme: colorscheme,
  appBarTheme: AppBarTheme(),

  textTheme: GoogleFonts.latoTextTheme(),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: TabBaritem(),
    );
  }
}
