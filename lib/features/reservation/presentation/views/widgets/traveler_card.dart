import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../data/models/traveler_model.dart'; // For date formatting

class TravelerCard extends StatelessWidget {
  final TravelerModel traveler;

  const TravelerCard({super.key, required this.traveler});

  @override
  Widget build(BuildContext context) {
    // Calculate age based on current date and birthday
    // int age = DateTime.now().year - traveler.birthday.year;

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
        title: Row(
          children: [
            Text('${traveler.firstName} ${traveler.lastName}'),
          ],
        ),
        subtitle: Row(
          children: [
            const Text('Age: 19'),
            const SizedBox(width: 10), // Add spacing between age and gender
            Text('Gender: ${traveler.gender}'),
          ],
        ),
      ),
    );
  }
}
