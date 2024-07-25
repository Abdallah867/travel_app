import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/functions/custom_app_bar.dart';
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
import '../../../trip/presentation/views/widgets/trip_card.dart';
import 'widgets/price_range_slider.dart';

class TripsListView extends StatefulWidget {
  const TripsListView({super.key});

  @override
  TripsListViewState createState() => TripsListViewState();
}

class TripsListViewState extends State<TripsListView> {
  final PagingController<int, TripModel> pagingController =
      PagingController(firstPageKey: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(S.of(context).availableTrips),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(slivers: [
          const SliverToBoxAdapter(
            child: SearchBarAndFilterWidget(),
          ),
          PagedSliverList(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return const TripCard();
              },
            ),
          ),
        ]),
      ),
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
          onTap: () => _showFilterBottomSheet(context),
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

  void _showFilterBottomSheet(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
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
                  controller: textEditingController,
                ),
                const VerticalSpace(size: 16),
                DateSelectorField(
                  label: S.of(context).returnDate,
                  controller: textEditingController,
                ),
                const VerticalSpace(size: 16),
                const PriceRangeSlider(),
                const Expanded(child: SizedBox()),
                CustomButton(text: 'Apply', onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}
