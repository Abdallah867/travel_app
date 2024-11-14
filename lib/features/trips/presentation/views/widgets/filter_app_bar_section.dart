import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/presentation/views/widgets/title_section.dart';
import '../../manager/bloc/trips_list_bloc.dart';
import 'package:flutter/material.dart';

class FilterAppBarSection extends StatelessWidget {
  const FilterAppBarSection({
    super.key,
    required this.tripsListBloc,
  });

  final TripsListBloc tripsListBloc;

  @override
  Widget build(BuildContext context) {
    return TitleSection(
      title: S.of(context).filterTrips,
      actionTitle: Text(
        S.of(context).clear,
        style: TextStyles.textStyle14.copyWith(
          color: AppColors.secondaryColor,
          fontWeight: FontWeightHelper.semiBold,
        ),
      ),
      onTap: () {
        tripsListBloc.add(const TripsListFilterClear());
      },
    );
  }
}
