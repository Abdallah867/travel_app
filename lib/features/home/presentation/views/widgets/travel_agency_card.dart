import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/app_name_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../../trip/presentation/views/widgets/review_widget.dart';
import '../../../data/models/agency_model.dart';
import 'travel_agency_logo.dart';

class TravelAgencyCard extends StatelessWidget {
  final AgencyModel agency;
  const TravelAgencyCard({super.key, required this.agency});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppNameRoutes.kAgencyDetails,
          pathParameters: {'agencyId': agency.agencyId},
          extra: [agency, context.read<CurrentAccountCubit>()],
        );
      },
      child: Container(
        width: 130.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TravelAgencyLogo(),
            SizedBox(height: 8.h),
            Text(
              agency.agnecyName,
              style: TextStyles.textStyle14,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReviewWidget(
                  review: agency.rating!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
