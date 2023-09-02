import 'package:flutter/material.dart';

class SnackbarUtil {
  static void showSnackbar(
    BuildContext context, {
    required String message,
    Color? backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        content: Text(
          message,
          style: const TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
}
