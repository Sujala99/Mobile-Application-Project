import 'package:flutter/material.dart';

void showMySnackBar({
  required BuildContext context,
  required String message,
  required Color color,
}) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}