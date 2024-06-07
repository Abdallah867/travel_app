import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
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
