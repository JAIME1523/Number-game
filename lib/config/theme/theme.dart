import 'package:flutter/material.dart';
import 'package:number_game/config/theme/colors_theme.dart';

class Apptheme {
  ThemeData getTheme() => ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 90
        ),
        useMaterial3: true,
        colorSchemeSeed:ColorsTheme.primary,
      );
}
