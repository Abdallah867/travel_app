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
import '../../data/models/trip_model.dart';
import '../../data/repos/trip_repo_impl.dart';
import '../manager/get_saved_trips_cubit.dart/get_saved_trips_cubit.dart';
import '../manager/trip_cubit/trip_cubit.dart';
import 'widgets/save_trip_list_view.dart';
import 'widgets/saved_trips_bloc_builder.dart';
import 'widgets/horizontal_trip_card.dart';
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
