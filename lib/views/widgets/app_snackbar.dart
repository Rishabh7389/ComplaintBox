import 'package:flutter/material.dart';

void showSnackBar(context, message, color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 3,
    content: Text(message, style: const TextStyle(fontSize: 15)),
    backgroundColor: color,
    duration: const Duration(seconds: 4),
    action: SnackBarAction(
      label: "OK",
      onPressed: () {},
      textColor: Colors.white,
    ),
  ));
}
