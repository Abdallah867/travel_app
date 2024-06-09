import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import 'widgets/logout_button.dart';
import 'widgets/profile_menus_list_view.dart';
import 'widgets/profile_informations_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAccountCubit, CurrentAccountState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const HorizontalSpace(size: double.infinity),
                    const VerticalSpace(size: 60),
                    ProfileInformationsWidget(
                      user: BlocProvider.of<CurrentAccountCubit>(context)
                          .userInformations,
                    ),
                    const VerticalSpace(size: 24),
                  ],
                ),
              ),
              const ProfileMenusListView(),
              const SliverToBoxAdapter(child: VerticalSpace(size: 16)),
              const LogoutButton(),
            ],
          ),
        );
      },
    );
  }
}
