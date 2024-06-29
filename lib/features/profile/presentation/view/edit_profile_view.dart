import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../data/models/user_model.dart';
import '../../data/repos/user_profile_repo_impl.dart';
import '../manager/cubit/edit_profile_cubit.dart';
import 'widgets/edit_profile_bloc_consumer.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        BlocProvider.of<CurrentAccountCubit>(context).userInformations!;
    return Scaffold(
      appBar: customAppBar(S.of(context).editProfile),
      body: BlocProvider(
        create: (context) => EditProfileCubit(
          userProfileRepo: getIt.get<UserProfileRepoImpl>(),
          user: user,
        )
          ..setInitialValue()
          ..setupControllerListeners(),
        child: EditProfileBlocConsumer(user: user),
      ),
    );
  }
}
