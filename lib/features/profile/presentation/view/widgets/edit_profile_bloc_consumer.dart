import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/functions/validate_email.dart';
import '../../../../../core/functions/validate_password.dart';
import '../../../../../core/functions/validate_phone_number.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../data/models/user_model.dart';
import '../../manager/cubit/edit_profile_cubit.dart';
import 'profile_informations_widget.dart';

class EditProfileBlocConsumer extends StatelessWidget {
  const EditProfileBlocConsumer({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit =
        BlocProvider.of<EditProfileCubit>(context);
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        handlingEditProfileListener(state, context, editProfileCubit);
      },
      builder: (context, state) {
        print('tefa7a 1');

        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: editProfileCubit.formKey,
              child: AbsorbPointer(
                absorbing: state is EditProfileLoadInProgress,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // const VerticalSpace(size: 24),
                      ProfileInformationsWidget(
                        user: editProfileCubit.user,
                      ),
                      const VerticalSpace(size: 24),
                      CustomTextFormField(
                        name: 'Username',
                        controller: editProfileCubit.usernameController,
                      ),
                      const VerticalSpace(size: 16),
                      CustomTextFormField(
                        name: 'Email',
                        controller: editProfileCubit.emailController,
                        validator: (value) => validateEmail(value, context),
                      ),
                      const VerticalSpace(size: 16),
                      CustomTextFormField(
                        name: 'Phone Number',
                        controller: editProfileCubit.phoneNumberController,
                        validator: (value) =>
                            validatePhoneNumber(value, context),
                      ),
                      const VerticalSpace(size: 16),
                      CustomTextFormField(
                        name: 'Password',
                        isPassword: true,
                        controller: editProfileCubit.passwordController,
                        validator: (value) => validatePassword(value, context),
                      ),
                      const VerticalSpace(size: 32),
                      state is! EditProfileLoadInProgress
                          ? CustomButtonBlocBuilder(
                              editProfileCubit: editProfileCubit)
                          : const CircularProgressIndicator(),
                      const VerticalSpace(size: 100),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void handlingEditProfileListener(EditProfileState state, BuildContext context,
      EditProfileCubit editProfileCubit) {
    if (state is EditProfileSuccess) {
      BlocProvider.of<CurrentAccountCubit>(context)
          .updateUserInformations(editProfileCubit.user);
      editProfileCubit.setInitialValue();
      showSnackBar(context, 'Profile updated successfully', AppStrings.success);
      // context.pop();
    }
    if (state is EditProfileFailure) {
      showSnackBar(context, state.errMessage, AppStrings.error);
    }
  }
}

class CustomButtonBlocBuilder extends StatelessWidget {
  const CustomButtonBlocBuilder({
    super.key,
    required this.editProfileCubit,
  });

  final EditProfileCubit editProfileCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return state is EditProfileInformationChanged
            ? CustomButton(
                text: 'Save',
                onPressed: !state.isChanged
                    ? null
                    : () async {
                        if (editProfileCubit.formKey.currentState!.validate()) {
                          await editProfileCubit.updateUserData();
                        }
                      },
              )
            : const SizedBox();
      },
    );
  }
}
