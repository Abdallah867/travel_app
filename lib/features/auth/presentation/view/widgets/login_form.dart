import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/validate_email.dart';
import '../../../../../core/functions/validate_password.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/login_cubit/login_cubit.dart';
import 'login_bloc_consumer.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().loginKey,
      child: Column(
        children: [
          CustomTextFormField(
            name: 'Email',
            initialValue: 'abdoallahusma5704@gmail.com',
            // controller: context.read<LoginCubit>().emailController,
            validator: (value) {
              return validateEmail(value, context);
            },
          ),
          const VerticalSpace(size: 25),
          CustomTextFormField(
              name: 'Password',
              isPassword: true,
              initialValue: 'Abdallah23',
              // controller: context.read<LoginCubit>().passwordController,
              validator: (value) {
                return validatePassword(value, context);
              }),
          const VerticalSpace(size: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Forgot Password ?",
                style: TextStyles.textStyle14.copyWith(
                    fontWeight: FontWeightHelper.semiBold,
                    color: AppColors.secondaryColor),
              ),
            ],
          ),
          const VerticalSpace(size: 35),
          LoginBlocConsumer(loginKey: context.read<LoginCubit>().loginKey),
        ],
      ),
    );
  }
}
