import 'package:flutter/material.dart';

import 'custom_circular_icon.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key});

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return isSaved
        ? CustomCircularIcon(
            icon: Icons.bookmark,
            onPressed: () {
              setState(() {
                isSaved = !isSaved;
              });
            },
          )
        : CustomCircularIcon(
            onPressed: () {
              setState(() {
                isSaved = !isSaved;
              });
            },
            icon: Icons.bookmark_outline,
          );
  }
}
