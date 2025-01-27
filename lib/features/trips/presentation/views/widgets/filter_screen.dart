import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/bloc/trips_list_bloc.dart';
import 'departure_date_fields.dart';
import 'filter_app_bar_section.dart';
import 'package:flutter/material.dart';
import 'price_range_slider.dart';
import 'return_date_fields.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({
    super.key,
    required this.tripsListBloc,
  });

  final TripsListBloc tripsListBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 100,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const VerticalSpace(size: 12),
            FilterAppBarSection(tripsListBloc: tripsListBloc),
            const VerticalSpace(size: 8),
            const Divider(),
            const VerticalSpace(size: 32),
            Text(
              'Departure Date',
              style: TextStyles.textStyle14SemiBold,
              textAlign: TextAlign.start,
            ),
            const VerticalSpace(size: 16),
            DepartureDateFields(tripsListBloc: tripsListBloc),
            const VerticalSpace(size: 32),
            Text(
              'Return Date',
              style: TextStyles.textStyle14SemiBold,
              textAlign: TextAlign.start,
            ),
            const VerticalSpace(size: 16),
            ReturnDateFields(tripsListBloc: tripsListBloc),
            const VerticalSpace(size: 32),
            const PriceRangeSlider(),
            const Expanded(child: SizedBox()),
            CustomButton(
              text: 'Apply',
              onPressed: () {
                tripsListBloc.add(const TripsListFilterApplied(''));
                Navigator.pop(context);
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
