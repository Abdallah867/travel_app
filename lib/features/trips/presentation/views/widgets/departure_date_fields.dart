import '../../../../reservation/presentation/views/widgets/date_selector_field.dart';
import '../../manager/bloc/trips_list_bloc.dart';
import 'package:flutter/material.dart';

class DepartureDateFields extends StatelessWidget {
  const DepartureDateFields({
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
          controller: tripsListBloc.betweenDepartureDateController,
        ),
        DateSelectorField(
          label: 'And:',
          controller: tripsListBloc.andDepartureDateController,
        ),
      ],
    );
  }
}
