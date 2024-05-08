import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/login_cubit/login_cubit.dart';
import 'login_bloc_consumer.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> loginKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginKey,
      child: Column(
        children: [
          CustomTextFormField(
            name: 'Email',
            controller: context.read<LoginCubit>().emailController,
          ),
          const VerticalSpace(size: 25),
          CustomTextFormField(
            name: 'Password',
            isPassword: true,
            controller: context.read<LoginCubit>().passwordController,
          ),
          const VerticalSpace(size: 35),
          LoginBlocConsumer(loginKey: loginKey),
        ],
      ),
    );
  }
}
