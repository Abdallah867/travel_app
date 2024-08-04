import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../trip/data/models/trip_model.dart';
import '../../../trip/data/repos/trip_repo_impl.dart';
import '../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../../trip/presentation/views/widgets/trip_card.dart';
import '../manager/bloc/trips_list_bloc.dart';
import 'widgets/paged_loading_trips_list.dart';
import 'widgets/search_bar_and_filter_widget.dart';

class TripsListView extends StatefulWidget {
  const TripsListView({super.key});

  @override
  TripsListViewState createState() => TripsListViewState();
}

class TripsListViewState extends State<TripsListView> {
  final PagingController<String?, TripModel> _pagingController =
      PagingController(firstPageKey: null);

  String? lastId;
  bool isFirstPage = true;

  @override
  void initState() {
    final tripsListBloc = context.read<TripsListBloc>();
    _pagingController.addPageRequestListener(
      (lastId) async {
        if (isFirstPage) {
          tripsListBloc.add(const TripsListFirstPageFetch());
          isFirstPage = !isFirstPage;
        } else {
          tripsListBloc.add(
            TripsListNextPageRequested(
              lastId: lastId,
            ),
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(S.of(context).availableTrips),
      body: BlocListener<TripsListBloc, TripsListState>(
        listener: (context, state) {
          if (state is TripsListLoaded) {
            final List<TripModel> tripsList = state.trips;
            final bool isLastPage = tripsList.length < AppConstants.pageSize;
            if (isLastPage) {
              _pagingController.appendLastPage(tripsList);
            } else {
              _pagingController.appendPage(tripsList, tripsList.last.tripId);
            }
          }
          if (state is TripsListFailure) {
            _pagingController.error = state.errMessage;
            print(state.errMessage);
          }
        },
        child: RefreshIndicator(
          onRefresh: () async {
            _pagingController.refresh();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: SearchBarAndFilterWidget(),
                ),
                PagedSliverList<String?, TripModel>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate(
                    firstPageProgressIndicatorBuilder: (_) =>
                        const PagedLoadingTripsList(),
                    itemBuilder: (context, trip, index) {
                      return BlocProvider(
                        create: (context) => TripCubit(
                            tripRepo: getIt.get<TripRepoImpl>(), trip: trip),
                        child: Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: const TripCard(),
                        ),
                      );
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: VerticalSpace(
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
