import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/manager/logout_cubit/logout_cubit.dart';

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
            ? SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: CustomButton(
                    text: S.of(context).logout,
                    color: Colors.red,
                    onPressed: () async {
                      await BlocProvider.of<LogoutCubit>(context).logoutUser();
                    },
                  ),
                ),
              )
            : const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              );
      },
    );
  }
}
