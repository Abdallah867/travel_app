import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../trip/data/models/trip_model.dart';
import '../../../trip/data/repos/trip_repo_impl.dart';
import '../../../trip/presentation/manager/get_saved_trips_cubit.dart/get_saved_trips_cubit.dart';
import '../../../trip/presentation/manager/trip_details_cubit/trip_cubit.dart';
import 'widgets/location_and_price_widget.dart';
import 'widgets/review_widget.dart';

class SavedTripsView extends StatelessWidget {
  const SavedTripsView({super.key});

  @override
  Widget build(BuildContext context) {
    final userId =
        BlocProvider.of<CurrentAccountCubit>(context).userInformations?.userId;

    return BlocProvider(
      create: (context) =>
          GetSavedTripsCubit(tripRepo: getIt.get<TripRepoImpl>())
            ..getSavedTrips(userId: userId!),
      child: const Scaffold(
        body: SavedTripsBlocBuilder(),
      ),
    );
  }
}

class SavedTripsBlocBuilder extends StatelessWidget {
  const SavedTripsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSavedTripsCubit, GetSavedTripsState>(
      builder: (context, state) {
        if (state is GetSavedTripsLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetSavedTripsSuccess) {
          return const Center(child: SaveTripListView());
        } else {
          return const Text('an error occured');
        }
      },
    );
  }
}

class SaveTripListView extends StatelessWidget {
  const SaveTripListView({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsCubit = BlocProvider.of<GetSavedTripsCubit>(context);
    List<TripModel> savedTrips = tripsCubit.savedTrips;

    if (savedTrips.isNotEmpty) {
      return SizedBox(
        // height: 300.h,
        child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            // scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => BlocProvider(
                  create: (context) => TripCubit(
                    trip: savedTrips[index],
                  ),
                  child: const HorizontalTripCard(),
                ),
            itemCount: savedTrips.length,
            separatorBuilder: (BuildContext context, int index) =>
                const HorizontalSpace(size: 15)),
      );
    } else {
      return const Center(child: Text('No Saved Trips'));
    }
  }
}

class HorizontalTripCard extends StatelessWidget {
  const HorizontalTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    final trip = BlocProvider.of<TripCubit>(context).trip;
    return GestureDetector(
      onTap: () {
        context.push(
          '${AppRoutes.kTrips}/1',
          extra: BlocProvider.of<TripCubit>(context),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          // border radius
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.whiteColor,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, bottom: 16.h, top: 16.h),
              height: 72.h,
              width: 72.w,
              decoration: BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
            ),
            const HorizontalSpace(size: 12),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HorizontalSpace(size: double.infinity),
                    Text(trip.title, style: TextStyles.textStyle20Bold),
                    const VerticalSpace(size: 4),
                    ReviewWidget(
                      review: trip.rating,
                    ),
                    const VerticalSpace(size: 4),
                    const LocationAndPriceWidget(),
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
