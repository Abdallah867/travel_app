import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/date_format_utils.dart';
import '../../../data/models/trip_schedule_model.dart';

class TripInfoWidget extends StatelessWidget {
  final TripScheduleModel tripSchedule;
  const TripInfoWidget({
    super.key,
    required this.tripSchedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("Departure Date: ", tripSchedule.departureDate,
              Icons.calendar_today),
          _buildInfoRow(
              "Return Date: ", tripSchedule.returnDate, Icons.calendar_today),
          _buildInfoRow(
              "Seats Available: ",
              "${tripSchedule.seatsAvailable} seats",
              Icons.airline_seat_recline_normal),
          _buildInfoRow("Duration: ", "5 days", Icons.access_time),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(iconData, size: 20.0),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
