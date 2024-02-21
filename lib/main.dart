import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'presentation/page/pages.dart';
import 'presentation/provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => HomeProvider(), child: const MyApp())
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: NotificationsService.messagerKey,
        debugShowCheckedModeBanner: false,
        theme: Apptheme().getTheme(),
        title: 'Game number',
        home: const HomePage());
  }
}
