import 'package:flutter/material.dart';

import '../../../data/models/trip_schedule_model.dart';
import 'not_selected_date_widget.dart';
import 'selected_date_widget.dart';

class DateSelectWidget extends StatelessWidget {
  final bool isSelected;

  final TripScheduleModel tripSchedule;
  const DateSelectWidget({
    super.key,
    required this.tripSchedule,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? SelectedDateWidget(
            schedule: tripSchedule,
          )
        : NotSelectedDateWidget(
            schedule: tripSchedule,
          );
  }
}
