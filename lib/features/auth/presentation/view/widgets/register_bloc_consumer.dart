import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/circular_loading_widget.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/register_cubit/register_cubit.dart';

class RegisterBlocConsumer extends StatelessWidget {
  const RegisterBlocConsumer({
    super.key,
    required GlobalKey<FormState> registerKey,
  }) : _registerKey = registerKey;

  final GlobalKey<FormState> _registerKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showSnackBar(
              context, 'Account Created Successfully', AppStrings.success);
          context.go(AppRoutes.kHomeView);
        }
        if (state is RegisterFailure) {
          String errorMessage = state.errMessage;
          showSnackBar(context, errorMessage, AppStrings.error);
        }
      },
      builder: (context, state) {
        return state is! RegisterLoading
            ? CustomButton(
                text: S.of(context).signup,
                onPressed: () async {
                  if (_registerKey.currentState!.validate()) {
                    BlocProvider.of<RegisterCubit>(context).registerUser();
                  }
                },
              )
            : const CircularLoadingWidget();
      },
    );
  }
}
