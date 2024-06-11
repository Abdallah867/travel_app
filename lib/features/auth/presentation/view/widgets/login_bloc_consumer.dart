import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/circular_loading_widget.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginBlocConsumer extends StatelessWidget {
  const LoginBlocConsumer({
    super.key,
    required GlobalKey<FormState> loginKey,
  }) : _loginKey = loginKey;

  final GlobalKey<FormState> _loginKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          showSnackBar(context, 'Logged in Successfully', AppStrings.success);
          context.go(AppRoutes.kHomeView);
        }
        if (state is LoginFailure) {
          String errorMessage = state.errMessage;
          showSnackBar(context, errorMessage, AppStrings.error);
        }
      },
      builder: (context, state) {
        return state is! LoginLoading
            ? CustomButton(
                text: AppStrings.login,
                onPressed: () async {
                  if (_loginKey.currentState!.validate()) {
                    context.read<LoginCubit>().loginUser();
                  }
                },
              )
            : const CircularLoadingWidget();
      },
    );
  }
}
