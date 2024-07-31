import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/font_weight_helper.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/views/widgets/title_section.dart';
import '../../../reservation/presentation/views/widgets/date_selector_field.dart';
import '../../../trip/data/models/trip_model.dart';
import '../../../trip/data/repos/trip_repo_impl.dart';
import '../../../trip/presentation/manager/trip_cubit/trip_cubit.dart';
import '../../../trip/presentation/views/widgets/shimmer_trip_card.dart';
import '../../../trip/presentation/views/widgets/trip_card.dart';
import '../../data/repos/trips_list_repo_impl.dart';
import '../manager/bloc/trips_list_bloc.dart';
import 'widgets/price_range_slider.dart';

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

    if (!isFirstPage) {
      _pagingController.addPageRequestListener(
        (lastId) async {
          tripsListBloc.add(
            TripsListNextPageRequested(
              lastId: lastId,
            ),
          );
          super.initState();
        },
      );
    } else {
      tripsListBloc.add(const TripsListFirstPageFetch());
      isFirstPage = !isFirstPage;
      super.initState();
    }
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
              _pagingController.value;
            }
          }
          if (state is TripsListFailure) {
            _pagingController.error = state.errMessage;
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(slivers: [
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
          ]),
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

class PagedLoadingTripsList extends StatelessWidget {
  const PagedLoadingTripsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpace(size: 16),
        ShimmerTripCard(),
        VerticalSpace(size: 16),
        ShimmerTripCard(),
        VerticalSpace(size: 16),
        ShimmerTripCard(),
        VerticalSpace(size: 16),
        ShimmerTripCard(),
        VerticalSpace(size: 16),
        ShimmerTripCard(),
      ],
    );
  }
}

class SearchBarAndFilterWidget extends StatelessWidget {
  const SearchBarAndFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CustomSearchBar()),
        const HorizontalSpace(size: 8),
        GestureDetector(
          onTap: () => showFilterBottomSheet(
            context,
            context.read<TripsListBloc>(),
          ),
          child: Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: AppColors.whiteColor,
            ),
            child: const Icon(
              Icons.filter_list,
              size: 32.0,
            ),
          ),
        )
      ],
    );
  }

  void showFilterBottomSheet(
      BuildContext context, TripsListBloc tripsListBloc) {
    final tripsListBloc = context.read<TripsListBloc>();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: tripsListBloc,
          child: SizedBox(
            height: 500.h,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const VerticalSpace(size: 12),
                  TitleSection(
                    title: S.of(context).filterTrips,
                    actionTitle: Text(
                      S.of(context).clear,
                      style: TextStyles.textStyle14.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  const VerticalSpace(size: 8),
                  const Divider(),
                  const VerticalSpace(size: 8),
                  DateSelectorField(
                    label: S.of(context).departureDate,
                    controller: tripsListBloc.departureDateController,
                  ),
                  const VerticalSpace(size: 16),
                  DateSelectorField(
                    label: S.of(context).returnDate,
                    controller: tripsListBloc.returnDateController,
                  ),
                  const VerticalSpace(size: 16),
                  const PriceRangeSlider(),
                  const Expanded(child: SizedBox()),
                  CustomButton(text: 'Apply', onPressed: () {}),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
