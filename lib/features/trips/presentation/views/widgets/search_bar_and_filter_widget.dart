import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_search_bar.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../manager/bloc/trips_list_bloc.dart';
import 'filter_screen.dart';

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
          child: SafeArea(
            child: FilterScreen(tripsListBloc: tripsListBloc),
          ),
        );
      },
    );
  }
}
