import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../trip/presentation/views/widgets/location_and_price_widget.dart';
import '../../../trip/presentation/views/widgets/review_widget.dart';
import '../../../trip/presentation/views/widgets/trip_card.dart';

class BookingsListView extends StatelessWidget {
  const BookingsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [ResCard()],
    );
  }
}

class ResCard extends StatelessWidget {
  const ResCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border radius
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(17, 17, 26, 0.1),
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
        color: AppColors.whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 16.w,
                  top: 12.h,
                  bottom: 12.h,
                ),
                child: const CustomImageBox(imageUrl: 'trip.coverImage'),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HorizontalSpace(size: double.infinity),
                      Text('trip.title', style: TextStyles.textStyle16SemiBold),
                      const VerticalSpace(size: 4),
                      const ReviewWidget(
                        review: 5.0,
                      ),
                      const VerticalSpace(size: 4),
                      // const LocationAndPriceWidget(),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'View Details',
                  onPressed: () {},
                ),
              ),
              Expanded(
                child: CustomButton(
                  text: 'View Details',
                  onPressed: () {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border radius
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(17, 17, 26, 0.1),
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(
              0,
              1,
            ),
          ),
        ],
        color: AppColors.whiteColor,
      ),
      child: Expanded(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                top: 12.h,
                bottom: 12.h,
              ),
              child: const CustomImageBox(imageUrl: 'trip.coverImage'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HorizontalSpace(size: double.infinity),
                    Text('trip.title', style: TextStyles.textStyle16SemiBold),
                    const VerticalSpace(size: 4),
                    const ReviewWidget(
                      review: 5.0,
                    ),
                    const VerticalSpace(size: 4),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
