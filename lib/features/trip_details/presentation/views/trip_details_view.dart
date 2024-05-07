import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  Container(
                    height: 400.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.r),
                          bottomRight: Radius.circular(32.r)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0.w, vertical: 16.h),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCircularIcon(
                          icon: Icons.arrow_back,
                        ),
                        CustomCircularIcon(
                          icon: Icons.bookmark_outline,
                        ),
                      ],
                    ),
                  ),
                ],
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCircularIcon extends StatelessWidget {
  final IconData icon;
  const CustomCircularIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 28,
      child: Icon(
        icon,
        size: 32,
      ),
    );
  }
}
