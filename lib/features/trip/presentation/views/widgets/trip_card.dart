import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import '../../../../home/presentation/views/widgets/card_informations.dart';
import 'trip_image.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '${AppRoutes.kTrips}/1',
          extra: BlocProvider.of<TripCubit>(context),
        );
      },
      child: Container(
        width: 212.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(36.r)),
          color: AppColors.whiteColor,
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
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
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

class TripCardShimmer extends StatelessWidget {
  const TripCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomShimmer.box(
        height: 208.h,
        width: 208.w,
      ),
      CustomShimmer(
        width: 208.w,
      ),
      CustomShimmer(
        width: 208.w,
      ),
      CustomShimmer(
        width: 208.w,
      ),
    ]);
  }
}
