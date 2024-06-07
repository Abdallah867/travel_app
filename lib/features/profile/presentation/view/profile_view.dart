import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/centered_text.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import 'widgets/profile_menus_list_view.dart';
import 'widgets/profile_picture_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAccountCubit, CurrentAccountState>(
      builder: (context, state) {
        final user =
            BlocProvider.of<CurrentAccountCubit>(context).userInformations;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const HorizontalSpace(size: double.infinity),
                    const VerticalSpace(size: 60),
                    const ProfilePictureWidget(),
                    const VerticalSpace(size: 8),
                    CenteredText(
                      text: user!.username,
                      style: TextStyles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    CenteredText(
                      text: user.email,
                      style: TextStyles.textStyle14,
                    ),
                    const VerticalSpace(size: 24),
                  ],
                ),
              ),
              const ProfileMenusListView(),
            ],
          ),
        );
      },
    );
  }
}
