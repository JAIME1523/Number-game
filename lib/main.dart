import 'package:flutter/material.dart';

import 'config/config.dart';
import 'presentation/page/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Apptheme().getTheme(),
        title: 'Juego de números',
        home: HomePage());
  }
}
