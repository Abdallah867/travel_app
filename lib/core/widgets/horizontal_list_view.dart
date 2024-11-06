import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'horizontal_space.dart';

class HorizontalListView<T> extends StatelessWidget {
  final Widget child;
  final double height;
  final double spacing;
  final int itemCount;
  final List<T> data;
  const HorizontalListView({
    super.key,
    required this.child,
    this.height = 79,
    this.spacing = 16,
    required this.itemCount,
    this.data = const [],
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0.w),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => child,
          itemCount: itemCount,
          separatorBuilder: (BuildContext context, int index) =>
              HorizontalSpace(size: spacing),
        ),
      ),
    );
  }
}
