import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/functions/custom_app_bar.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../home/data/models/agency_model.dart';
import '../../../home/presentation/views/widgets/travel_agency_card.dart';
import '../manager/bloc/agencies_bloc.dart';
import 'widgets/search_bar_and_filter_widget.dart';

class AgenciesView extends StatefulWidget {
  const AgenciesView({super.key});

  @override
  AgenciesViewState createState() => AgenciesViewState();
}

class AgenciesViewState extends State<AgenciesView> {
  final PagingController<String?, AgencyModel> _pagingController =
      PagingController(firstPageKey: null);

  String? lastId;
  bool isFirstPage = true;
  bool isFiltering = false;

  @override
  void initState() {
    final agenciesBloc = context.read<AgenciesBloc>();
    _pagingController.addPageRequestListener(
      (lastId) async {
        if (isFirstPage) {
          agenciesBloc.add(const AgenciesFirstPageFetch());
          isFirstPage = !isFirstPage;
        } else {
          agenciesBloc.add(
            AgenciesNextPageRequested(
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
      body: BlocListener<AgenciesBloc, AgenciesState>(
        listener: (context, state) {
          if (state is AgenciesRefreshed) {
            _pagingController.refresh();
          }
          if (state is AgenciesLoaded) {
            final List<AgencyModel> agencies = state.agencies;
            log('$agencies');
            final bool isLastPage = agencies.length < AppConstants.pageSize;
            if (isLastPage) {
              _pagingController.appendLastPage(agencies);
            } else {
              _pagingController.appendPage(agencies, agencies.last.agencyId);
            }
          }
          if (state is AgenciesFailure) {
            _pagingController.error = state.errMessage;
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: const SearchBarAndFilterWidget(),
                  ),
                ),
                PagedSliverList<String?, AgencyModel>(
                  pagingController: _pagingController,
                  builderDelegate: PagedChildBuilderDelegate(
                    firstPageProgressIndicatorBuilder: (_) =>
                        const CircularProgressIndicator(),
                    itemBuilder: (context, agency, index) {
                      return TravelAgencyCard(
                        agency: agency,
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
