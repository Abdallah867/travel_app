import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import 'travel_agency_card.dart';

class TravelAgenciesListView extends StatelessWidget {
  const TravelAgenciesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 79.h,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0.w),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>
              const TravelAgencyCard(),
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) =>
              const HorizontalSpace(size: 15),
        ),
      ),
    );
  }
}
