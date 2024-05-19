import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../auth/data/repos/auth_rep_impl.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../../profile/data/repos/user_profile_repo_impl.dart';
import 'widgets/home_bloc_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrentAccountCubit(
        authRepo: getIt.get<AuthRepoImpl>(),
        userProfileRepo: getIt.get<UserProfileRepoImpl>(),
      )..currentUserAccount(),
      child: const HomeBlocBuilder(),
    );
  }
}
