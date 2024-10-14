import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/presentation/views/widgets/title_section.dart';
import '../../../../reservation/presentation/views/widgets/date_selector_field.dart';
import '../../manager/bloc/trips_list_bloc.dart';
import 'price_range_slider.dart';

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
                  CustomButton(
                      text: 'Apply',
                      onPressed: () {
                        tripsListBloc.add(const TripsListFilterApplied());
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
