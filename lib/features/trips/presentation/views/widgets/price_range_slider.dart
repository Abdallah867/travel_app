import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/bloc/trips_list_bloc.dart';

class PriceRangeSlider extends StatefulWidget {
  const PriceRangeSlider({
    super.key,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  final double min = 1000;
  final double max = 100000;
  RangeValues currentRangeValues = const RangeValues(1000, 100000);

  @override
  Widget build(BuildContext context) {
    final TripsListBloc tripsListBloc = context.read<TripsListBloc>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              S.of(context).priceRange,
              style: TextStyles.textStyle14SemiBold,
            ),
          ],
        ),
        RangeSlider(
          onChangeEnd: (values) {
            tripsListBloc.minPrice = values.start.round();
            tripsListBloc.maxPrice = values.end.round();
          },
          onChanged: (values) {
            setState(() {
              currentRangeValues = values;
            });
          },
          activeColor: AppColors.secondaryColor,
          values: currentRangeValues,
          min: min,
          max: max,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Min price: ${currentRangeValues.start.round()} ${S.of(context).algerianCurrency}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Max price: ${currentRangeValues.end.round()} ${S.of(context).algerianCurrency}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
