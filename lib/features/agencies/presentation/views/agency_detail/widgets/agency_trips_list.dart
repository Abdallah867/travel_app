import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/services/service_locator.dart';
import '../../../../../trip/data/models/trip_model.dart';
import '../../../../../trip/data/repos/trip_repo_impl.dart';
import '../../../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../../../../trip/presentation/views/widgets/trip_card.dart';
import '../../../../../trips/presentation/views/widgets/paged_loading_trips_list.dart';
import '../agency_details_cubit/agency_details_cubit.dart';

class AgencyTripsList extends StatefulWidget {
  const AgencyTripsList({super.key});

  @override
  State<AgencyTripsList> createState() => _AgencyTripsListState();
}

class _AgencyTripsListState extends State<AgencyTripsList> {
  final PagingController<String?, TripModel> _pagingController =
      PagingController(firstPageKey: null);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<AgencyDetailsCubit>(context).getAgencyTrips(pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AgencyDetailsCubit, AgencyDetailsState>(
      listener: (context, state) {
        if (state is AgencyDetailsTripsLoaded) {
          if (state.trips.length < AppConstants.pageSize) {
            _pagingController.appendLastPage(state.trips);
          } else {
            _pagingController.appendPage(state.trips, state.trips.last.tripId);
          }
        }

        if (state is AgencyDetailsTripsFailure) {
          _pagingController.error = state.errMessage;
        }
      },
      child: PaginationTripsList(pagingController: _pagingController),
    );
  }
}

class PaginationTripsList extends StatelessWidget {
  const PaginationTripsList({
    super.key,
    required PagingController<String?, TripModel> pagingController,
  }) : _pagingController = pagingController;

  final PagingController<String?, TripModel> _pagingController;

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<String?, TripModel>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        firstPageProgressIndicatorBuilder: (_) => const PagedLoadingTripsList(),
        noItemsFoundIndicatorBuilder: (_) =>
            const Center(child: Text('No Trips Found')),
        itemBuilder: (context, trip, index) {
          return BlocProvider(
            create: (context) =>
                TripCubit(tripRepo: getIt.get<TripRepoImpl>(), trip: trip),
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: const TripCard(),
            ),
          );
        },
      ),
    );
  }
}
