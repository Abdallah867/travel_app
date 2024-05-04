import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/font_weight_helper.dart';
import 'package:travel_app/core/utils/text_styles.dart';
import 'package:travel_app/core/widgets/horizontal_space.dart';
import 'package:travel_app/core/widgets/vertical_widget.dart';

class TripDetailsView extends StatelessWidget {
  final String tripId;
  const TripDetailsView({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverToBoxAdapter(
            child: Container(
              height: 400.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.r),
                    bottomRight: Radius.circular(32.r)),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: VerticalSpace(size: 96)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                HorizontalSpace(size: 24.w),
                Text(
                  'Description',
                  style: TextStyles.textStyle16
                      .copyWith(fontWeight: FontWeightHelper.bold),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                HorizontalSpace(size: 24.w),
                Expanded(
                  child: Text(
                    'Lorem ipsum jkjkjljjjllkjljljlkjljjkljlkjlkljmmmmmhdjshdjshdjshdjhsjdhsjdhsjdhjsdhmmmmmmdjshjdshjdhsjdhsjds Read More....',
                    style: TextStyles.textStyle16
                        .copyWith(fontWeight: FontWeightHelper.regular),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                HorizontalSpace(size: 24.w),
                Expanded(
                  child: Text(
                    'Lorem ipsum jkjkjljjjllkjljljlkjljjkljlkjlkljmmmmmhdjshdjshdjshdjhsjdhsjdhsjdhjsdhmmmmmmdjshjdshjdhsjdhsjds Read More....',
                    style: TextStyles.textStyle16
                        .copyWith(fontWeight: FontWeightHelper.regular),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                HorizontalSpace(size: 24.w),
                Expanded(
                  child: Text(
                    'Lorem ipsum jkjkjljjjllkjljljlkjljjkljlkjlkljmmmmmhdjshdjshdjshdjhsjdhsjdhsjdhjsdhmmmmmmdjshjdshjdhsjdhsjds Read More....',
                    style: TextStyles.textStyle16
                        .copyWith(fontWeight: FontWeightHelper.regular),
                  ),
                ),
                VerticalSpace(size: 1000)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
