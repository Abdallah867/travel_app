import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../data/models/trip_model.dart';
import '../../../data/repos/trip_repo_impl.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'trip_card.dart';

class TripsList extends StatelessWidget {
  const TripsList({
    super.key,
    required this.trips,
  });

  final List<TripModel> trips;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return BlocProvider(
              create: (context) => TripCubit(
                trip: trips[index],
                tripRepo: getIt.get<TripRepoImpl>(),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: const TripCard(),
              ),
            );
          },
          childCount: trips.length < 5 ? trips.length : 5,
        ),
      ),
    );
  }
}
