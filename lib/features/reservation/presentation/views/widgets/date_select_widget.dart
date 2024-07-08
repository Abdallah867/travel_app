import 'package:flutter/material.dart';
import '../../../data/models/trip_schedule_model.dart';
import 'not_selected_date_widget.dart';
import 'selected_date_widget.dart';

class DateSelectWidget extends StatelessWidget {
  final bool isSelected;
  final TripScheduleModel tripScheduleModel;
  const DateSelectWidget({
    super.key,
    required this.tripScheduleModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? const SelectedDateWidget()
        : const NotSelectedDateWidget();
  }
}
