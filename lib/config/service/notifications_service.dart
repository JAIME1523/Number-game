import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messagerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    if (message.isEmpty) return;
    messagerKey.currentState!.clearSnackBars();
    final snackbar = SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );

    messagerKey.currentState!.showSnackBar(snackbar);
  }
}
