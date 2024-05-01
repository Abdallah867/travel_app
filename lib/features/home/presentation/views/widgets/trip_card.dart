import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/font_weight_helper.dart';
import 'package:travel_app/core/widgets/vertical_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/horizontal_space.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32.r)),
        color: AppColors.whiteColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.h),
              height: 208.h,
              width: 208.w,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(32.r)),
              ),
            ),
            const InformationsCard(),
          ],
        ),
      ),
    );
  }
}

class InformationsCard extends StatelessWidget {
  const InformationsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerticalSpace(size: 4),
          Text(
            'Voyage à Skikda',
            style: TextStyles.textStyle16
                .copyWith(fontWeight: FontWeightHelper.semiBold),
          ),
          const VerticalSpace(size: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: AppColors.lighterGrey,
                    size: 16,
                  ),
                  const HorizontalSpace(size: 2),
                  Text(
                    'Skikda',
                    style: TextStyles.textStyle14.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: AppColors.lighterGrey,
                    ),
                  ),
                ],
              ),
              Text(
                '20.000 DZD',
                style: TextStyles.textStyle14.copyWith(
                  fontWeight: FontWeightHelper.semiBold,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
