import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/custom_app_bar.dart';
import '../../../../../core/services/service_locator.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../../home/data/models/agency_model.dart';
import '../../../../trips/data/repos/trips_list_repo_impl.dart';
import 'agency_details_cubit/agency_details_cubit.dart';
import 'widgets/agency_details_card.dart';
import 'widgets/agency_trips_list.dart';

class AgencyDetailsView extends StatelessWidget {
  final AgencyModel agency;
  final CurrentAccountCubit currentAccountCubit;
  const AgencyDetailsView({
    super.key,
    required this.agency,
    required this.currentAccountCubit,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AgencyDetailsCubit(
            agency,
            getIt.get<TripsListRepoImpl>(),
          ),
        ),
        BlocProvider.value(
          value: currentAccountCubit,
        ),
      ],
      child: Scaffold(
        appBar: customAppBar(agency.agnecyName),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: AgencyDetailsCard(
                agency: agency,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              sliver: SliverToBoxAdapter(
                  child: Text('Trips', style: TextStyles.textStyle20SemiBold)),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: const AgencyTripsList(),
            ),
          ],
        ),
      ),
    );
  }
}
