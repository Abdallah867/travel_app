import 'package:flutter/material.dart';

class CustomSliverList extends StatelessWidget {
  final List<Widget> children;
  const CustomSliverList({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Column(children: children);
        },
        childCount: 1,
      ),
    );
  }
}
