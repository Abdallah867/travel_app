import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAccountCubit, CurrentAccountState>(
      builder: (context, state) {
        return state is CurrentAccountExists
            ? Text(context.read<CurrentAccountCubit>().userInformations!.userId)
            : const Text('No user');
      },
    );
  }
}
