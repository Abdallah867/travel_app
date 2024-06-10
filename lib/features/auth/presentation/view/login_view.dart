import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../data/repos/auth_repo_impl.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(authRepo: getIt.get<AuthRepoImpl>()),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const VerticalSpace(size: 35),
                    const LoginForm(),
                    const VerticalSpace(size: 25),
                    CustomButton(
                      text: AppStrings.register,
                      color: AppColors.greyColor,
                      width: 254,
                      onPressed: () => context.go(AppRoutes.kRegisterView),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
