import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/features/profile/data/repos/user_profile_repo_impl.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../data/repos/auth_rep_impl.dart';
import '../manager/register_cubit/register_cubit.dart';
import 'widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          authRepo: getIt.get<AuthRepoImpl>(),
          userProfileRepo: getIt.get<UserProfileRepoImpl>()),
      child: const RegisterViewBody(),
    );
  }
}

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const VerticalSpace(size: 35),
                  const RegisterForm(),
                  const VerticalSpace(size: 25),
                  CustomButton(
                    text: AppStrings.login,
                    color: AppColors.greyColor,
                    width: 254,
                    onPressed: () => context.go(AppRoutes.kLoginView),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
