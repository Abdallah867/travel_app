import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';
import 'profile_menu.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          showSnackBar(context, 'Logged out succesfully', AppStrings.success);
          context.go(AppRoutes.kRegisterView);
        }
        if (state is LogoutFailure) {
          showSnackBar(context, 'Logout failed', AppStrings.error);
        }
      },
      builder: (context, state) {
        return state is! LogoutLoadInProgress
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  width: double.infinity,
                  child: ProfileMenu(
                    name: S.of(context).logout,
                    icon: Icons.logout,
                    onTap: () async {
                      await BlocProvider.of<LogoutCubit>(context).logoutUser();
                    },
                    color: Colors.red,
                  ),
                ))
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
      },
    );
  }
}
