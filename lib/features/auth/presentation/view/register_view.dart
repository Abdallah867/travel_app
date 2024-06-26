import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../profile/data/repos/user_profile_repo_impl.dart';
import '../../data/repos/auth_repo_impl.dart';
import '../manager/register_cubit/register_cubit.dart';
import 'widgets/have_an_account_widget.dart';
import 'widgets/register_form.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
          authRepo: getIt.get<AuthRepoImpl>(),
          userProfileRepo: getIt.get<UserProfileRepoImpl>()),
      child: Scaffold(
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const VerticalSpace(size: 154),
                    Text('Welcome!', style: TextStyles.textStyle28),
                    Text(
                      'Enter your credentials to create your account',
                      style: TextStyles.textStyle16WithOpacity,
                    ),
                    const VerticalSpace(size: 40),
                    const RegisterForm(),
                    const VerticalSpace(size: 20),
                    const HaveAnAccountWidget()
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
