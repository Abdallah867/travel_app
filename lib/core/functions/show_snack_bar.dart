import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, String type) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
