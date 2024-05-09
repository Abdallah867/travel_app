import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/core/widgets/custom_button.dart';
import 'package:travel_app/core/widgets/horizontal_space.dart';
import 'package:travel_app/core/widgets/vertical_widget.dart';

import '../../../../core/utils/app_colors.dart';
import 'widgets/custom_circular_icon.dart';
import 'widgets/description_widget.dart';
import 'widgets/details_title_section.dart';
import 'widgets/expandable_text.dart';
import 'widgets/save_button.dart';

class TripDetailsView extends StatelessWidget {
  final String tripId;
  const TripDetailsView({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BookingAndTripPlanButton(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  CustomTripDetailImage(),
                  CustomTripDetailsAppBar(),
                ],
              ),
            ),
            SliverToBoxAdapter(child: VerticalSpace(size: 96)),
            SliverToBoxAdapter(child: DescriptionWidget()),
          ],
        ),
      ),
    );
  }
}

class CustomTripDetailImage extends StatelessWidget {
  const CustomTripDetailImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32.r),
            bottomRight: Radius.circular(32.r)),
      ),
    );
  }
}

class CustomTripDetailsAppBar extends StatelessWidget {
  const CustomTripDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCircularIcon(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => context.pop(),
          ),
          const SaveButton(),
        ],
      ),
    );
  }
}

class BookingAndTripPlanButton extends StatelessWidget {
  const BookingAndTripPlanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          CustomCircularIcon(
            radius: 36,
            bgColor: AppColors.greyBlueColor,
            icon: Icons.calendar_month_outlined,
            onPressed: () {},
          ),
          const HorizontalSpace(size: 12),
          Expanded(
            child: CustomButton(
              text: 'Book Now',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
