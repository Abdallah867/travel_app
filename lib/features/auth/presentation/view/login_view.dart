import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../data/repos/auth_repo_impl.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'widgets/dont_have_an_account.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const VerticalSpace(size: 154),
                    Text('Welcome Back!', style: TextStyles.textStyle28),
                    Text(
                      'Enter your email and password to continue',
                      style: TextStyles.textStyle16WithOpacity,
                    ),
                    const VerticalSpace(size: 40),
                    const LoginForm(),
                    const VerticalSpace(size: 20),
                    const DontHaveAnAccountWidget(),
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
