import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/data/repos/auth_repo_impl.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';
import '../../data/repos/user_profile_repo_impl.dart';
import '../manager/profile_cubit/edit_profile_cubit.dart';
import 'widgets/logout_button.dart';
import 'widgets/profile_menus_list_view.dart';
import 'widgets/profile_informations_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LogoutCubit(
            authRepo: getIt.get<AuthRepoImpl>(),
          ),
        ),
        BlocProvider(
            create: (context) => EditProfileCubit(
                  userProfileRepo: getIt.get<UserProfileRepoImpl>(),
                  user: BlocProvider.of<CurrentAccountCubit>(context)
                      .userInformations!,
                )
                  ..setInitialValue()
                  ..setupControllerListeners()),
      ],
      child: Scaffold(
        appBar: customAppBar(
          S.of(context).profile,
        ),
        body: const ProfileBlocBuilder(),
      ),
    );
  }
}

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileInformationChanged) {
          context.read<CurrentAccountCubit>().userInformations =
              context.read<EditProfileCubit>().user;
        }
      },
      builder: (context, state) {
        return const SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              HorizontalSpace(size: double.infinity),
              VerticalSpace(size: 16),
              ProfileInformationsWidget(),
              VerticalSpace(size: 24),
              ProfileMenusListView(),
              VerticalSpace(size: 16),
              LogoutButton(),
            ],
          ),
        );
      },
    );
  }
}
