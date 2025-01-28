import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../data/models/filter_trips_params.dart';
import '../../manager/bloc/trips_list_bloc.dart';
import 'date_fields.dart';
import 'filter_app_bar_section.dart';
import 'package:flutter/material.dart';
import 'price_range_slider.dart';
import 'return_date_fields.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
    required this.tripsListBloc,
  });

  final TripsListBloc tripsListBloc;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  TextEditingController betweenDepartureDateController =
      TextEditingController();
  TextEditingController andDepartureDateController = TextEditingController();
  TextEditingController andReturnDateController = TextEditingController();
  TextEditingController betweenReturnDateController = TextEditingController();

  @override
  void dispose() {
    betweenDepartureDateController.dispose();
    andDepartureDateController.dispose();
    betweenReturnDateController.dispose();
    andReturnDateController.dispose();
    super.dispose();
  }

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
            FilterAppBarSection(
              tripsListBloc: widget.tripsListBloc,
            ),
            const VerticalSpace(size: 8),
            const Divider(),
            const VerticalSpace(size: 32),
            Text(
              'Departure Date',
              style: TextStyles.textStyle14SemiBold,
              textAlign: TextAlign.start,
            ),
            const VerticalSpace(size: 16),
            DateFields(
              tripsListBloc: widget.tripsListBloc,
              controllers: [
                betweenDepartureDateController,
                andDepartureDateController
              ],
            ),
            const VerticalSpace(size: 32),
            Text(
              'Return Date',
              style: TextStyles.textStyle14SemiBold,
              textAlign: TextAlign.start,
            ),
            const VerticalSpace(size: 16),
            DateFields(
              tripsListBloc: widget.tripsListBloc,
              controllers: [
                betweenReturnDateController,
                andReturnDateController
              ],
            ),
            const VerticalSpace(size: 32),
            const PriceRangeSlider(),
            const Expanded(child: SizedBox()),
            CustomButton(
              text: 'Apply',
              onPressed: () {
                widget.tripsListBloc.add(
                  TripsListFilterApplied(
                    filterTripsParams: FilterTripsParams(
                      betweenDepartureDate: betweenDepartureDateController.text,
                      andReturnDate: andDepartureDateController.text,
                      betweenReturnDate: betweenReturnDateController.text,
                      andDepartureDate: andReturnDateController.text,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
