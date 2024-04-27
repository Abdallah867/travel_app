import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/text_styles.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/horizontal_space.dart';

class TripsAgenciesListView extends StatelessWidget {
  const TripsAgenciesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 79.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) =>
            const TripAgencyCard(),
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) =>
            const HorizontalSpace(
          size: 15,
        ),
      ),
    );
  }
}

class TripAgencyCard extends StatelessWidget {
  const TripAgencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 311.w,
      child: ListTile(
        tileColor: AppColors.whiteColor,
        title: Text(
          'Travel DZ',
          style: TextStyles.textStyle20.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
