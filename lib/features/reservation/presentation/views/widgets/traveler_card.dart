import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/date_format_utils.dart';
import '../../../data/models/traveler_model.dart';
import '../../manager/cubit/reservation_cubit.dart'; // For date formatting

class TravelerCard extends StatelessWidget {
  final TravelerModel traveler;

  const TravelerCard({super.key, required this.traveler});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        tileColor: AppColors.whiteColor,
        leading: CircleAvatar(
          child: Text('${traveler.firstName[0]}${traveler.lastName[0]}'),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            context
                .read<ReservationCubit>()
                .removeTraveler(traveler.travelerId);
          },
        ),
        title: Row(
          children: [
            Text('${traveler.firstName} ${traveler.lastName}'),
          ],
        ),
        subtitle: Row(
          children: [
            Text('Age: ${DateFormatUtils.calculateAge(traveler.birthday)}'),
            const SizedBox(width: 10),
            Text('Gender: ${traveler.gender}'),
          ],
        ),
      ),
    );
  }
}
