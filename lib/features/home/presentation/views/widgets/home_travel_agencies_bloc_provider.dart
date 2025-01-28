import '../../../../../core/services/service_locator.dart';
import '../../../../agencies/data/repos/agencies_repo_impl.dart';
import '../../../../agencies/presentation/views/agencies/manager/bloc/agencies_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'travel_agencies_list_view.dart';

class HomeTravelAgenciesBlocProvider extends StatelessWidget {
  const HomeTravelAgenciesBlocProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgenciesBloc(
        agenciesRepo: getIt.get<AgenciesRepoImpl>(),
      )..add(const AgenciesFirstPageFetch()),
      child: const TravelAgenciesListView(),
    );
  }
}
