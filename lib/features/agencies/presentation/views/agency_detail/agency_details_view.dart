import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../../home/data/models/agency_model.dart';
import '../../../../trips/data/repos/trips_list_repo_impl.dart';
import '../../../../trips/presentation/manager/bloc/trips_list_bloc.dart';
import '../../../../trips/presentation/views/trips_view.dart';

class AgencyDetailsView extends StatelessWidget {
  final AgencyModel agency;
  final CurrentAccountCubit currentAccountCubit;
  const AgencyDetailsView(
      {super.key, required this.agency, required this.currentAccountCubit});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TripsListBloc(
            tripsListRepo: getIt.get<TripsListRepoImpl>(),
            agencyId: agency.agencyId,
            isFiltering: true,
          ),
        ),
        BlocProvider.value(
          value: currentAccountCubit,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: const TripsView(),
      ),
    );
  }
}
