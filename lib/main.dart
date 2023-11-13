import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/scopes/favorites_meals_scope.dart';
import 'package:meals/scopes/filters_scope.dart';
import 'package:meals/screens/tabs_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return FiltersStateProvider(
      child: FavoritesMealsWidget(
        child: MaterialApp(
          theme: theme,
          home: const TabsScreen(),
        ),
      ),
    );
  }
}
