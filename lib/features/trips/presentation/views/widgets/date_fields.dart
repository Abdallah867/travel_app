import '../../../../reservation/presentation/views/widgets/date_selector_field.dart';
import '../../manager/bloc/trips_list_bloc.dart';
import 'package:flutter/material.dart';

class DateFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  const DateFields({
    super.key,
    required this.tripsListBloc,
    required this.controllers,
  });

  final TripsListBloc tripsListBloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DateSelectorField(
          label: 'Between:',
          controller: controllers[0],
        ),
        DateSelectorField(
          label: 'And:',
          controller: controllers[1],
        ),
      ],
    );
  }
}
