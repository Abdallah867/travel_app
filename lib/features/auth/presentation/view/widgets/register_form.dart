import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/register_cubit/register_cubit.dart';
import 'register_bloc_consumer.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().registerKey,
      child: Column(
        children: [
          CustomTextFormField(
            name: 'Username',
            controller: context.read<RegisterCubit>().usernameController,
          ),
          const VerticalSpace(size: 25),
          CustomTextFormField(
            name: 'Email',
            controller: context.read<RegisterCubit>().emailController,
          ),
          const VerticalSpace(size: 25),
          CustomTextFormField(
            name: 'Password',
            isPassword: true,
            controller: context.read<RegisterCubit>().passwordController,
          ),
          const VerticalSpace(size: 35),
          RegisterBlocConsumer(
            registerKey: context.read<RegisterCubit>().registerKey,
          ),
        ],
      ),
    );
  }
}
