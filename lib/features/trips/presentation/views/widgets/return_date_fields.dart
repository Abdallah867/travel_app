import '../../../../reservation/presentation/views/widgets/date_selector_field.dart';
import '../../manager/bloc/trips_list_bloc.dart';
import 'package:flutter/material.dart';

class ReturnDateFields extends StatelessWidget {
  const ReturnDateFields({
    super.key,
    required this.tripsListBloc,
  });

  final TripsListBloc tripsListBloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DateSelectorField(
          label: 'Between:',
          controller: tripsListBloc.betweenReturnDateController,
        ),
        DateSelectorField(
          label: 'And:',
          controller: tripsListBloc.andReturnDateController,
        ),
      ],
    );
  }
}
