import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../data/repos/trip_repo_impl.dart';
import '../../manager/saved_trips_cubit.dart/saved_trips_cubit.dart';
import 'custom_circular_icon.dart';
import 'save_button.dart';

class CustomTripDetailsAppBar extends StatelessWidget {
  const CustomTripDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userId =
        BlocProvider.of<CurrentAccountCubit>(context).userInformations?.userId;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCircularIcon(
            icon: Icons.arrow_back_ios_new,
            onPressed: () => context.pop(),
          ),
          BlocProvider(
            create: (context) =>
                SavedTripsCubit(tripRepo: getIt.get<TripRepoImpl>())
                  ..getSavedTrips(userId: userId!),
            child: const SaveButton(),
          ),
        ],
      ),
    );
  }
}
