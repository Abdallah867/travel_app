import 'package:flutter/material.dart';

class SliverText extends StatelessWidget {
  final String text;
  const SliverText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Text(text),
    );
  }
}
