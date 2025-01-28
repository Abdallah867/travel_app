import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../home/data/models/agency_model.dart';
import '../../../../../trip/presentation/views/widgets/contact_agency_widget.dart';

class AgencyDetailsCard extends StatelessWidget {
  final AgencyModel agency;

  const AgencyDetailsCard({super.key, required this.agency});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Agency Logo and Name
            Row(
              children: [
                agency.agencyLogo != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(agency.agencyLogo!),
                        radius: 30,
                      )
                    : const SizedBox(),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    agency.agnecyName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Description
            Text(
              agency.description,
              style: const TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
            const SizedBox(height: 14.0),

            // Email
            Row(
              children: [
                const Icon(
                  CupertinoIcons.mail,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    agency.email,
                    style: TextStyles.textStyle14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            // Phone Numbers
            agency.phoneNumbers.isNotEmpty
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(CupertinoIcons.phone,
                          color: AppColors.secondaryColor),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: ContactAgencyWidget(
                          phoneNumbers: agency.phoneNumbers,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 8.0),

            // Address
            Row(
              children: [
                const Icon(CupertinoIcons.location_solid,
                    color: AppColors.secondaryColor),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    agency.address,
                    style: TextStyles.textStyle14,
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 16.0),

            // Rating
            // Row(
            //   children: [
            //     const Icon(Icons.star, color: Colors.amber),
            //     const SizedBox(width: 8.0),
            //     Text(
            //       agency.rating!.toStringAsFixed(1),
            //       style: TextStyles.textStyle14,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
