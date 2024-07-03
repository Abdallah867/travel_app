import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/circular_loading_widget.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import 'nav_bar_view.dart';

class HomeBlocBuilder extends StatelessWidget {
  const HomeBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrentAccountCubit, CurrentAccountState>(
      listener: (context, state) {
        if (state is NoCurrentAccount) {
          context.go(AppRoutes.kRegisterView);
        }
      },
      builder: (context, state) {
        if (state is CurrentAccountExists) {
          return const NavBarView();
        } else if (state is CurrentAccountLoading) {
          return const CircularLoadingWidget();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
