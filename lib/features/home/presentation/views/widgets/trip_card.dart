import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../trip/presentation/manager/trip_details_cubit/trip_cubit.dart';
import 'card_informations.dart';
import 'trip_image.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('${AppRoutes.kTrips}/1');
      },
      child: Container(
        width: 208.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32.r)),
          color: AppColors.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TripImage(),
              CardInformations(),
            ],
          ),
        ),
      ),
    );
  }
}
